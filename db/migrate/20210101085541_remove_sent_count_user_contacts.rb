class RemoveSentCountUserContacts < ActiveRecord::Migration[5.2]
  def change

		remove_column :user_contacts, :sent_count, :integer
  	
  end
end
