class CreateExhibitionCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :exhibition_categories do |t|
      t.string :name
      t.string :display_name
      t.string :kana
      t.timestamps
    end
  end
end
