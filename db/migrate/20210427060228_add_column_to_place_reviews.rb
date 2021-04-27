class AddColumnToPlaceReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :place_reviews, :facility, :float
    add_column :place_reviews, :reservation, :float
    add_column :place_reviews, :price, :float
    add_column :place_reviews, :access, :float
  end
end
