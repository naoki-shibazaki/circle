class ChangeUserTimeStringToUsers < ActiveRecord::Migration[5.2]
  # def change
  # 	add_column :users, :user_time, :string
  # end

  def change
  	remove_column :users, :user_time
  end

end
