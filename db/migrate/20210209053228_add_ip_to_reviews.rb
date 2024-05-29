class AddIpToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :ip, :string
  end
end
