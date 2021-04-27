class ChangeColumnToPlaceReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :place_reviews, :facility, :float
    remove_column :place_reviews, :reservation, :float
    remove_column :place_reviews, :price, :float
    remove_column :place_reviews, :access, :float
    remove_column :place_reviews, :facility, :string
    remove_column :place_reviews, :reservation, :string
    remove_column :place_reviews, :price, :string
    remove_column :place_reviews, :access, :string
  end
end
