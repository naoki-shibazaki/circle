class CreateInvalidEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :invalid_emails do |t|

      t.string :email, unique:true

      t.timestamps
    end
  end
end
