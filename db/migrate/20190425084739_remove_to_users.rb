class RemoveToUsers < ActiveRecord::Migration[5.2]
  def change
  	remove_column :blogs, :blog_image_name, :string
  	remove_column :blogs, :photo_file_name, :string
  	remove_column :blogs, :photo_content_type, :string
  	remove_column :blogs, :photo_file_size, :string
  	remove_column :blogs, :photo_updated_at, :string
  	remove_column :blogs, :photo, :string

  end
end
