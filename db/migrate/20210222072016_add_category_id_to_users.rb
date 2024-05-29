class AddCategoryIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :category_id, :string
  end
end
