class AddUsersCountToEvents < ActiveRecord::Migration[5.2]
  def self.up
    add_column :events, :users_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :events, :users_count
  end
end
