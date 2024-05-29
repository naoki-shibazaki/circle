class AddAdminUserId3ToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_reference :users, :admin_user, index: true
  end
end