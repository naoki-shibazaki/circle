class AddMemberToMember < ActiveRecord::Migration[5.2]
  def change
  	# add_reference :members, :event_question, index: true
  	add_column :members, :nickname, :string
    add_column :members, :image_profile, :string
    add_column :members, :answer, :text
  end
end
