class AddNameToCities < ActiveRecord::Migration[5.2]
  def change
	add_column :cities, :name, :string
  end
end
