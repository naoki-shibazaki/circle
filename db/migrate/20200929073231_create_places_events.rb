class CreatePlacesEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :places_events do |t|
      t.references :place, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
