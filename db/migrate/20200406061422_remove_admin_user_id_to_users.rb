class RemoveAdminUserIdToUsers < ActiveRecord::Migration[5.2]
  def change
	  	remove_column :users, :admin_user_id, :string  	
  end
end
