class CreateExhibitionContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :exhibition_contacts do |t|
      t.references :exhibition, foreign_key: true, null: false
      t.string :name, null: false
      t.string :email, null: false
      t.integer :subject
      t.text :content, null: false

      t.timestamps
    end
  end
end
