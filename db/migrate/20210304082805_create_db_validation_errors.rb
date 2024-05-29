class CreateDbValidationErrors < ActiveRecord::Migration[5.2]
  def change
    create_table :db_validation_errors do |t|
      t.string :name
      t.text :content_01
      t.text :content_02
      t.text :content_03

      t.timestamps
    end
  end
end
