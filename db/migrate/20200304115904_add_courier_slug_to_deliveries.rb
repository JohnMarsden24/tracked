class AddCourierSlugToDeliveries < ActiveRecord::Migration[6.0]
  def change
    add_column :deliveries, :courier_slug, :string
  end
end
