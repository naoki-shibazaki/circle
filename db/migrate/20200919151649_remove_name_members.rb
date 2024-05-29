class RemoveNameMembers < ActiveRecord::Migration[5.2]
  def change
		remove_column :members, :name, :string
	  	add_column :members, :random_id, :string
  end
end
