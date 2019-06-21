class AddPhoto0425ToBlogs < ActiveRecord::Migration[5.2]
  def change
  	add_column :blogs, :blog_image_name, :string
  	add_column :blogs, :photo_file_name, :string
  	add_column :blogs, :photo_content_type, :string
  	add_column :blogs, :photo_file_size, :string
  	add_column :blogs, :photo_updated_at, :string
  	add_column :blogs, :photo, :string  	
  end
end
