class AddTrackingIdToDelivery < ActiveRecord::Migration[6.0]
  def change
    add_column :deliveries, :tracking_id, :string
  end
end
