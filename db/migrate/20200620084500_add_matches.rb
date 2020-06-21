class AddMatches < ActiveRecord::Migration[5.2]
  def change

  	add_column :matches, :age_group, :string
  	add_column :matches, :member, :string
  	add_column :matches, :level, :string
  	add_column :matches, :recruit, :string
  	add_column :matches, :comment, :text

  end
end
