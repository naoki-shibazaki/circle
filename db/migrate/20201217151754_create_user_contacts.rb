class CreateUserContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :user_contacts do |t|
      t.references :user, foreign_key: true
      t.integer :sent_count
      t.string :mail
      t.text :message

      t.timestamps
    end
  end
end
