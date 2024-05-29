class AddImageToBlogs < ActiveRecord::Migration[5.2]
  def change
  	add_column :blogs, :image_01, :string
  	add_column :blogs, :image_02, :string
  	add_column :blogs, :image_03, :string
  	add_column :blogs, :image_04, :string
  end
end
