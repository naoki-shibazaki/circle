class AddDescriptionToColumns < ActiveRecord::Migration[5.2]
  def change
  	add_column :columns, :description, :text
  	add_column :columns, :image, :string
  end
end
