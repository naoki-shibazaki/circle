class ChangeDataUserTimeToUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :user_time, 'date USING CAST(user_time AS date)'
  end
end
