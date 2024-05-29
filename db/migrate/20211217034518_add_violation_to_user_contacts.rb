class AddViolationToUserContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :user_contacts, :violation, :text
  end
end
