class AddColumnCbPointToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :cb_point, :float, null: false, default: 0
  end
end
