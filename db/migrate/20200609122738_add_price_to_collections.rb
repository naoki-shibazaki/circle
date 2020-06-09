class AddPriceToCollections < ActiveRecord::Migration[5.2]
  def change

	add_column :collections, :price, :integer

  end
end
