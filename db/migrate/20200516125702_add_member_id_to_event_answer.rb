class AddMemberIdToEventAnswer < ActiveRecord::Migration[5.2]
  def change
  	add_reference :event_answers, :member, index: true  	
  end
end
