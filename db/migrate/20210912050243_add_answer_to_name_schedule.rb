class AddAnswerToNameSchedule < ActiveRecord::Migration[5.2]
  def change
    add_column :name_schedules, :answer, :integer
    add_column :name_schedules, :comment, :string
  end
end