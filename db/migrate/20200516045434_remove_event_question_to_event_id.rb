class RemoveEventQuestionToEventId < ActiveRecord::Migration[5.2]
  def change
  	remove_column :event_questions, :event_id, :string  	
  end
end
