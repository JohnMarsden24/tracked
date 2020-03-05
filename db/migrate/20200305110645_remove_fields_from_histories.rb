class RemoveFieldsFromHistories < ActiveRecord::Migration[6.0]
  def change

    remove_column :histories, :message, :string

    remove_column :histories, :subtag_message, :string

    remove_column :histories, :location, :string

    remove_column :histories, :checkpoint_time, :string
  end
end
