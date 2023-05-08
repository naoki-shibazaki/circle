class CreateExhibitionGroupProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :exhibition_group_profiles do |t|

      t.references :exhibition_group, foreign_key: true, null: false
      t.string :name, null: false
      t.string :header_img
      t.string :profile_img
      t.string :instagram_id
      t.string :twitter_id
      t.string :web_url
      t.text :introduction
      t.integer :category
      t.timestamps
    end
  end

end
