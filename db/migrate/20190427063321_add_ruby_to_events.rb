class AddRubyToEvents < ActiveRecord::Migration[5.2]
  def change
  	remove_column :events, :kana, :string
  	add_column :events, :ruby, :string
  end
end
