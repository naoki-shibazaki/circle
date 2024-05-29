class AddOrderToPrefectures < ActiveRecord::Migration[5.2]
  def change
	add_column :prefectures, :order, :string
  end
end
