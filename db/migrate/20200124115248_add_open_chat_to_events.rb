class AddOpenChatToEvents < ActiveRecord::Migration[5.2]
  def change
  	add_column :events, :openchat, :string
  end
end