class RemoveAdminUserId3ToUsers < ActiveRecord::Migration[5.2]
  def change
  	 remove_reference :users, :admin_user_id, index: true
  end
end
