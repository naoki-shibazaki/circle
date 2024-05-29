class AddPlacesCountToPrefectures < ActiveRecord::Migration[5.2]
  def self.up
    add_column :prefectures, :places_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :prefectures, :places_count
  end
end
