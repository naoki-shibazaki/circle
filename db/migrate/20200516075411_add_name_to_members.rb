class AddNameToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :name, :string
    add_index :members, :name, unique: true
  end
end
