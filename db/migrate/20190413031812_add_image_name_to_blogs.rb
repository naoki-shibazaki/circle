class AddImageNameToBlogs < ActiveRecord::Migration[5.2]
  def change
  	add_column :blogs, :content, :text  	
  	add_column :blogs, :blog_image_name, :string
  end
end
