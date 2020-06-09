class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :collection, foreign_key: true
      t.string :name
      t.integer :money
      t.string :check

      t.timestamps
    end
  end
end
