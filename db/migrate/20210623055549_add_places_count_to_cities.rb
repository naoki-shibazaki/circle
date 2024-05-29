class AddPlacesCountToCities < ActiveRecord::Migration[5.2]
  def self.up
    add_column :cities, :places_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :cities, :places_count
  end
end
