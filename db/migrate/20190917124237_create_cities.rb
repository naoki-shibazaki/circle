class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :prefecture_id
      t.string :city
      t.string :city_kana

      t.timestamps
    end
  end
end
