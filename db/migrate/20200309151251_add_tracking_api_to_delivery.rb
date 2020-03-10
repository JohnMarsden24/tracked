class AddTrackingApiToDelivery < ActiveRecord::Migration[6.0]
  def change
    add_column :deliveries, :tracking_api, :string
  end
end
