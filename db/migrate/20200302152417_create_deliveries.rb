class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :name
      t.string :courier
      t.string :tracking_number
      t.string :status
      t.string :history
      t.date :expected_arrival_date
      t.date :arrival_date
      t.boolean :delivered
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
