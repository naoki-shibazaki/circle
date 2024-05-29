class AddPicUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :pic_profile, :string
  	add_column :users, :pic_header, :string
  end
end
