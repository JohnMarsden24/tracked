class Delivery < ApplicationRecord
  belongs_to :user
  has_many :tags, dependent: :destroy
  has_one :history, dependent: :destroy
  validates :tracking_number, uniqueness: true, presence: true
  validates :tracking_number, uniqueness: true, presence: true
  validates :user_id, presence: true

  COURIERS = ["DPD", "Fedex", "Parcel Force", "Yodel", "UK Mail", "Royal Mail", "TNT", "Amazon"].sort

  COURIERS_SLUG = {
    "DPD" => "dpd-uk",
    "Fedex" => "fedex-uk",
    "Parcel Force" => "parcel-force",
    # "Collect+" => "collectplus",
    "Yodel" => "yodel",
    "UK Mail" => "uk-mail",
    "Royal Mail" => "royal-mail",
    "TNT" => "tnt-uk",
    "Amazon" => "amazon-logistics-uk"
  }



  AfterShip.api_key = "79319b1a-de06-4279-942e-62a95a1fe2b5"

  #"79319b1a-de06-4279-942e-62a95a1fe2b5" - Jan's key
  #79319b1a-de06-4279-942e-62a95a1fe2b5

  #"7beee5c2-ca2b-49c5-a0c8-ee57c0b18434" - John's key

  def first_tracking(slug, tracking_number)
    AfterShip::V4::Tracking.get("#{slug}", "#{tracking_number}")
  end

  def try_tracking(tracking_id)
    AfterShip::V4::Tracking.get(self.courier_slug, self.tracking_number)
  end

  def get_tracking(tracking_id)
    response = try_tracking(tracking_id)
    counter = 0
    while response["data"]["tracking"]["tag"] == "Pending" && counter < 60
      response = try_tracking(tracking_id)
      puts "Waiting for API to update (#{counter + 1})"
      counter += 1
      sleep 2
    end
    return response
  end

  def create_tracking_id(slug, tracking_number)
    HTTParty.post("https://api.aftership.com/v4/trackings",
      headers: {
        "aftership-api-key" => "79319b1a-de06-4279-942e-62a95a1fe2b5",
        "Content-Type" => "application/json"
      },
      body: {
        "tracking" => {
          "slug" => "#{slug}",
          "tracking_number" => "#{tracking_number}",
        }
      }.to_json
    )
  end


  def tracking
    self.courier_slug = COURIERS_SLUG[self.courier]
    tracking_api = create_tracking_id(self.courier_slug, self.tracking_number)["data"]["tracking"]["id"]
    tracking_data = get_tracking(tracking_api)["data"]
    self.status = set_status(tracking_data["tracking"]["tag"])
    self.expected_arrival_date = tracking_data["tracking"]["expected_delivery"]
    self.tracking_api = tracking_api
    delivery_history = tracking_data["tracking"]["checkpoints"]
  end

  def set_status(tag)
    delayed_status = ["FailedAttempt", "Exception"]
    transit_status = ["InTransit", "OutforDelivery", "InfoReceived"]
    delivered_status = ["Delivered"]
    if tag.in?(delayed_status)
      return "Delayed"
    elsif tag.in?(transit_status)
      return "On its way"
    elsif tag.in?(delivered_status)
      return "Delivered"
    else
      return "Error"
    end
  end

  def update_tracking
    tracking_id = self.tracking_api
    tracking_data = AfterShip::V4::Tracking.get(self.courier_slug, self.tracking_number)["data"]
    self.status = set_status(tracking_data["tracking"]["tag"])
    self.expected_arrival_date = tracking_data["tracking"]["expected_delivery"]
    history_array = tracking_data["tracking"]["checkpoints"]
    if self.save
      p "Inside Save"
      history_array.each do |tracking_event|
        location = tracking_event['country_iso3']
        if location.nil?
          location = tracking_event['location']
        end
        p location
        self.history['status_updates'] << [tracking_event['message'], location, tracking_event['checkpoint_time']]
      end
    end
  end

  def arrival
    today = Date.today.yday
    if self.expected_arrival_date.nil?
      "on its way"
    else
      delivery_date = Date.parse(self.expected_arrival_date.to_s).yday
      if today == delivery_date
        "today"
      elsif (today +1) == delivery_date
        "tomorrow"
      elsif (today + 7) > delivery_date
        "within the next 7 days"
      end
    end
  end

  include PgSearch::Model
  pg_search_scope :search_by_everything,
    against: [ :name, :courier, :tracking_number, :status, :expected_arrival_date, :arrival_date, :delivered ],
    associated_against: {
      tags: [ :name ],
    },
    using: {
      tsearch: { prefix: true }
    }


end
