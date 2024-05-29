class AddOrderTxtToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :order, :string
    add_column :categories, :txt, :string
  end
end
