require('aftership')
class Delivery < ApplicationRecord
  belongs_to :user
  has_many :tags
  has_many :histories
  validates :tracking_number, uniqueness: true, presence: true
  validates :user_id, presence: true

  AfterShip.api_key = "7beee5c2-ca2b-49c5-a0c8-ee57c0b18434"

  def tracking(delivery)
    courier = detect_courier(delivery.tracking_number)
    delivery.courier_slug = courier["data"]["couriers"].first["slug"]
    delivery.courier = courier["data"]["couriers"].first["name"]
    details = create_tracking(delivery.courier_slug, delivery)
    delivery.expected_arrival_date = details['data']['tracking']['expected_delivery']
    delivery.status = details["data"]["tracking"]["subtag_message"]
    history = details["data"]["tracking"]["checkpoints"]
    to_be_returned = {delivery: delivery, history: history}
    return to_be_returned
  end

  def update_delivery
    raise
    delivery_hash = new_delivery.tracking( { name: self.courier_slug, tracking_number: self.tracking_number } )
    delivery = delivery_hash[:delivery]
    history_array = delivery_hash[:history]
    if delivery.save
      history = History.new
      history.create_history(history_array, delivery)
      redirect_to user_path(current_user)
    else
      render "users/show"
    end
  end

  def create_tracking(courier_create, delivery)
    AfterShip::V4::Tracking.get(courier_create, delivery.tracking_number)
  end

  def detect_courier(tracking_number)
    AfterShip::V4::Courier.detect({:tracking_number => tracking_number})
  end
end
