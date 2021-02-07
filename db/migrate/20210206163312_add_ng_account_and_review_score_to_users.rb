class AddNgAccountAndReviewScoreToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :review_score, :string
    add_column :users, :ng_account, :string
  end
end
