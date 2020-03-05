class History < ApplicationRecord
  belongs_to :delivery

  def create_history(history_array, delivery)
    self.delivery_id =  delivery.id
    history_array.each do |tracking_event|
      self['status_updates'] << [tracking_event['message'], tracking_event['country_iso3'], tracking_event['checkpoint_time']]
    end
  end

end
