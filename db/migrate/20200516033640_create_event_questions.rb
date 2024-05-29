class CreateEventQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :event_questions do |t|
      t.string :event_id

      t.timestamps
    end
  end
end
