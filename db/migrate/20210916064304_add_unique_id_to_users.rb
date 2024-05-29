class AddUniqueIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :unique_id, :string

    add_column :schedules, :member_venue, :string
    add_column :schedules, :recruitment_numbers, :integer

  end
end
