class AddOrderToTags < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :order, :string
  end
end
