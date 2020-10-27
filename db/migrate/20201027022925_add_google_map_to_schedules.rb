class AddGoogleMapToSchedules < ActiveRecord::Migration[5.2]
  def change
  		add_column :schedules, :google_map, :string
  end
end
