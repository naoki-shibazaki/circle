class RemoveEventIdToMember < ActiveRecord::Migration[5.2]
  def change
    # remove_foreign_key :members, :event_questions
    # remove_reference :members, :event_question, index: true
    remove_column :members, :answer, :text
  end
end
