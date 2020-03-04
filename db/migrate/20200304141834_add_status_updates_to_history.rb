class AddStatusUpdatesToHistory < ActiveRecord::Migration[6.0]
  def change
    add_column :histories, :status_updates, :string, array: true, default: []
  end
end
