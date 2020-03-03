class CreateHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :histories do |t|
      t.string :message
      t.string :subtag_message
      t.string :location
      t.string :checkpoint_time
      t.references :delivery, null: false, foreign_key: true

      t.timestamps
    end

    remove_column :deliveries, :history, :string
  end
end
