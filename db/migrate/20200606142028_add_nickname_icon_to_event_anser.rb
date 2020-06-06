class AddNicknameIconToEventAnser < ActiveRecord::Migration[5.2]
  def change
	add_column :event_answers, :nickname, :string
	add_column :event_answers, :icon, :string
  end
end
