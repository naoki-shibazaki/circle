class AddContactDelToUserContacts < ActiveRecord::Migration[5.2]
  def change

    add_column :user_contacts, :contact_del, :string
    add_column :user_contacts, :comment, :text

  end
end
