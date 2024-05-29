class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :city_id
      t.string :name

      t.timestamps
    end
  end
end
