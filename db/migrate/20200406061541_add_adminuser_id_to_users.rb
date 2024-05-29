class AddAdminuserIdToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_reference :users, :admin_user_id, index: true
  end
end
