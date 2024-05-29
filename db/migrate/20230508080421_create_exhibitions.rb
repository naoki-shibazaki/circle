class CreateExhibitions < ActiveRecord::Migration[6.0]
  def change
    create_table :exhibitions do |t|
      t.references :exhibition_group, foreign_key: true, null: false
      t.references :prefecture, foreign_key: true, null: false
      t.string :name, null: false
      t.datetime :event_date
      t.datetime :end_date
      t.string :header_img
      t.string :gallery_img_01
      t.string :gallery_img_02
      t.string :gallery_img_03
      t.string :gallery_img_04
      t.string :venue_name
      t.string :venue_address
      t.text :detail
      t.integer :online, default: 1
      t.integer :show_contact, default: 1
      t.integer :exhibit_person_price
      t.integer :visitor_price

      t.timestamps
    end
  end
end
