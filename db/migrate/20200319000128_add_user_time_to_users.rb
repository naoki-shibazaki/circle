class AddUserTimeToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :user_time, :string
  end
end
