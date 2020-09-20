class AddGenderToMember < ActiveRecord::Migration[5.2]
  def change

  	add_column :members, :gender, :string
  	add_column :members, :profile, :text
  	
  	add_column :admin_users, :gender, :string
  	add_column :admin_users, :nickname, :string
  	add_column :admin_users, :image_profile, :string
  	add_column :admin_users, :profile, :text

  end
end
