class RemoveUserIdToSchedules < ActiveRecord::Migration[5.2]
  def change
  	remove_column :schedules, :s_user_id, :string
  end
end
