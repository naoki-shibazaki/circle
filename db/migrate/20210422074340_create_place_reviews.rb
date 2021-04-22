class CreatePlaceReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :place_reviews do |t|
      t.string :facility
      t.string :reservation
      t.string :price
      t.string :access
      t.integer :event_id
      t.string :ip_address
      t.text :comment
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
