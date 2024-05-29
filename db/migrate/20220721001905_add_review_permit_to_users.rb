class AddReviewPermitToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :review_permit, :boolean, default: true
  end
end
