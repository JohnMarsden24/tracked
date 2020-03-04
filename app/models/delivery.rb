require('aftership')
class Delivery < ApplicationRecord
  belongs_to :user
  has_many :tags
  has_one :history
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
    delivery_hash = tracking(self)
    delivery = delivery_hash[:delivery]
    history_array = delivery_hash[:history]
    if delivery.save
      history_array.each do |tracking_event|
        delivery.history['status_updates'] << [tracking_event['message'], tracking_event['location'], tracking_event['checkpoint_time']]
      end
      delivery.save
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
