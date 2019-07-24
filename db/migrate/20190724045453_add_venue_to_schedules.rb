class AddVenueToSchedules < ActiveRecord::Migration[5.2]
  def change
  	add_column :schedules, :venue, :string
  end
end
