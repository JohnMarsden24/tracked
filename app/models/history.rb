class History < ApplicationRecord
  belongs_to :delivery

  def create_history(history_array, delivery)
    history_array.each do |history|
      new_history = History.new
      new_history.message = history["message"]
      new_history.subtag_message = history["subtag_message"]
      new_history.location = history["location"]
      new_history.checkpoint_time = history["checkpoint_time"]
      new_history.delivery_id = delivery.id
      new_history.save
    end
  end

end
