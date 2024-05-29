class AddEventIdToEventQuestion < ActiveRecord::Migration[5.2]
  def change
  	add_reference :event_questions, :event, index: true  	
  end
end