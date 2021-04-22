class AddAverageScoreToPalceReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :place_reviews, :average_score, :float
  end
end
