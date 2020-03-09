class AddFakeToDelivery < ActiveRecord::Migration[6.0]
  def change
    add_column :deliveries, :fake, :boolean, default: false
  end
end
