class AddIpAddressToUserContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :user_contacts, :ip_address, :string
    add_column :user_contacts, :account_block, :string
  end
end
