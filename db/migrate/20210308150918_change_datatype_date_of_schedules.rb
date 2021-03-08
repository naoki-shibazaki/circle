class ChangeDatatypeDateOfSchedules < ActiveRecord::Migration[5.2]
  def change
    change_column :schedules, :date, :string
  end
end
