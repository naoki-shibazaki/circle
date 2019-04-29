class AddDecadeToAges < ActiveRecord::Migration[5.2]
  def change
  	 remove_column :ages, :age, :string
  	add_column :ages, :decade, :string
  end
end
