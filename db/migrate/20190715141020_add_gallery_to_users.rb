class AddGalleryToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :gallery_01, :string
  	add_column :users, :gallery_02, :string
  	add_column :users, :gallery_03, :string  	
  	add_column :users, :gallery_04, :string  	  	
  end
end
