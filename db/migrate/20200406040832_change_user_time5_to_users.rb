class ChangeUserTime5ToUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :user_time, :string	
  end
end
