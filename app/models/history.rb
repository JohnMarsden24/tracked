class History < ApplicationRecord
  belongs_to :delivery

  def self.create_history(delivery_data, delivery)
    history = History.new(delivery_id: delivery.id)
    delivery_data.each do |tracking_event|
      location = tracking_event['country_iso3']
      if location.nil?
        location = tracking_event['location']
      end
      history.status_updates << [tracking_event['message'], location, tracking_event['checkpoint_time']]
    end
    history.save
  end

end
