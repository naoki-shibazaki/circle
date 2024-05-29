class AddEntryToUserContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :user_contacts, :entry, :string
    add_column :user_contacts, :respond_check, :string
    add_column :user_contacts, :random_id, :string
  end
end