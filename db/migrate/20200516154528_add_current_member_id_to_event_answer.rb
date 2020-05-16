class AddCurrentMemberIdToEventAnswer < ActiveRecord::Migration[5.2]
  def change

    add_column :event_answers, :answer_member_id, :string

  end
end