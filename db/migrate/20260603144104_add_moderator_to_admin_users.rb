class AddModeratorToAdminUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :admin_users, :moderator, :boolean, default: false, null: false
  end
end
