require('aftership')
class Delivery < ApplicationRecord
  belongs_to :user
  has_many :tags, dependent: :destroy
  has_one :history, dependent: :destroy

  validates :tracking_number, uniqueness: true, presence: true
  validates :user_id, presence: true

  AfterShip.api_key = "7beee5c2-ca2b-49c5-a0c8-ee57c0b18434"

  def create_tracking(delivery)
    # detects possible list of couriers
    courier_data = detect_courier(delivery.tracking_number)
    if courier_data[:slug].length > 1
      # need a way to deal with mulitple couriers returned from detect_courier
      counter = 0
      tracking_data = get_tracking(courier_data[:slug][counter], delivery)
      while tracking_data["data"] == {}
        counter += 1
        tracking_data = get_tracking(courier_data[:slug][counter], delivery)
      end
        delivery.courier = courier_data[:courier_name][counter]
    else
      #gets tracking item with slug and delivery tracking number
      tracking_data = get_tracking(courier_data[:slug].first, delivery)
      delivery.courier = courier_data[:courier_name].first
    end
    # sets delivery values to the data returned from the get_tracking method
    delivery.expected_arrival_date = tracking_data["data"]["tracking"]["expected_delivery"]
    delivery.status = tracking_data["data"]["tracking"]["subtag_message"]
    delivery.courier_slug = courier_data[:slug][0]
    history = tracking_data["data"]["tracking"]["checkpoints"]
    delivery_data = {delivery: delivery, history: history}
    return delivery_data
  end

  def tracking(delivery)
    courier_data = detect_courier(delivery.tracking_number)
    delivery.courier_slug = courier_data[:slug][0]
    delivery.courier = courier_data[:courier_name][0]
    details = get_tracking(delivery.courier_slug, delivery)
    delivery.expected_arrival_date = details['data']['tracking']['expected_delivery']
    delivery.status = details["data"]["tracking"]["subtag_message"]
    history = details["data"]["tracking"]["checkpoints"]
    to_be_returned = {delivery: delivery, history: history}
    return to_be_returned
  end

  def update_delivery
    delivery_hash = tracking(self)
    delivery = delivery_hash[:delivery]
    history_array = delivery_hash[:history]
    if delivery.save
      history_array.each do |tracking_event|
        location = tracking_event['country_iso3']
        if location.nil?
          location = tracking_event['location']
        end
        delivery.history['status_updates'] << [tracking_event['message'], location, tracking_event['checkpoint_time']]
      end
      delivery.save
    else
      render "users/show"
    end
  end

  def get_tracking(slug, delivery)
    AfterShip::V4::Tracking.get(slug, delivery.tracking_number)
  end

  def detect_courier(tracking_number)
    results = AfterShip::V4::Courier.detect({tracking_number: tracking_number})["data"]
    courier_data = {
      slug: [],
      courier_name: []
    }
    if results["total"] > 1
      results["couriers"].each do |courier|
        courier_data[:slug] << courier["slug"]
        courier_data[:courier_name] << courier["name"]
      end
    else
      courier_data[:slug] << results["couriers"].first["slug"]
      courier_data[:courier_name] << results["couriers"].first["name"]
    end
    return courier_data
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
