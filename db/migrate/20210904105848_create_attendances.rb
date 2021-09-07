class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.references :schedule, foreign_key: true
      t.references :member, foreign_key: true
      t.integer :answer
      t.string :comment

      t.timestamps
    end
  end
end
