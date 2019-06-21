class AddOrderToEvents < ActiveRecord::Migration[5.2]
  def change
	add_column :events, :order, :string
  end
end
