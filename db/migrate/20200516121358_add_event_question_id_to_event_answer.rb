class AddEventQuestionIdToEventAnswer < ActiveRecord::Migration[5.2]
  def change
  	add_reference :event_answers, :event_question, index: true
  end
end