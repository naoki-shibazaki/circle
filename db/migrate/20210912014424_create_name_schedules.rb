class CreateNameSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :name_schedules do |t|
      t.references :name, foreign_key: true
      t.references :schedule, foreign_key: true

      t.timestamps
    end
  end
end
