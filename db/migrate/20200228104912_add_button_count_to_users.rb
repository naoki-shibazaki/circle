class AddButtonCountToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :line_count, :integer, default: 0
  	add_column :users, :mail_count, :integer, default: 0
  end
end
