class AddSortToPrefectures < ActiveRecord::Migration[5.2]
  def change
	add_column :prefectures, :sort, :integer 	
  end
end
