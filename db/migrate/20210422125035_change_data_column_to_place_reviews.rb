class ChangeDataColumnToPlaceReviews < ActiveRecord::Migration[5.2]
  def up
    change_column :place_reviews, :facility, :float
    change_column :place_reviews, :reservation, :float
    change_column :place_reviews, :price, :float
    change_column :place_reviews, :access, :float
  end

  def down
    change_column :place_reviews, :facility, :string
    change_column :place_reviews, :reservation, :string
    change_column :place_reviews, :price, :string
    change_column :place_reviews, :access, :string
  end
end
