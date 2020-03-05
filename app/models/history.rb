class History < ApplicationRecord
  belongs_to :delivery

  def create_history(history_array, delivery)
    self.delivery_id =  delivery.id
    history_array.each do |tracking_event|
      location = tracking_event['country_iso3']
      if location.nil?
          location = tracking_event['location']
        end
        self['status_updates'] << [tracking_event['message'], location, tracking_event['checkpoint_time']]
    end
  end

end
