class AddUserIdToSchedules < ActiveRecord::Migration[5.2]
  def change
  	add_column :schedules, :s_user_id, :string
  end
end
