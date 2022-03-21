class AddColumnToAdminUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :admin_users, :prefecture, index: true
    add_column :admin_users, :age, :string
    add_column :admin_users, :open, :integer, null: false, default: 0
  end

end
