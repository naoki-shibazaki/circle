class AddReviewToMembersReviews < ActiveRecord::Migration[5.2]
  def change

    add_column :members, :age, :string

    add_column :reviews, :age, :string
    add_column :reviews, :gender, :string
    add_column :reviews, :nickname, :string

  end
end
