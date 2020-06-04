class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :category
      t.string :tag
      t.string :name
      t.string :text

      t.timestamps
    end
  end
end
