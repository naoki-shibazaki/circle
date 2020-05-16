class AddEventQuestionToQuestion < ActiveRecord::Migration[5.2]
  def change
  	add_column :event_questions, :question, :string
  end
end