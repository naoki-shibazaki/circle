class AddAddressToSchedules < ActiveRecord::Migration[5.2]
  def change
  	add_column :schedules, :time_s, :time
  	add_column :schedules, :time_e, :time
  	add_column :schedules, :venue_address, :string
  	add_column :schedules, :note, :text  	
  end
end
