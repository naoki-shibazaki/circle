class ChangeDecadeToAges < ActiveRecord::Migration[5.2]
  def change

  	remove_column :ages, :decade, :string
  	add_column :ages, :decade, :integer

  end
end
