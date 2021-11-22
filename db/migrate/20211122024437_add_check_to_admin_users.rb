class AddCheckToAdminUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_users, :check, :integer
  end
end