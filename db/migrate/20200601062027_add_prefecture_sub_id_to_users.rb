class AddPrefectureSubIdToUsers < ActiveRecord::Migration[5.2]
  def change
  	  	add_column :users, :prefecture_sub_id, :integer
  end
end