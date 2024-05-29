class AddNameToUserContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :user_contacts, :name, :string
  end
end
