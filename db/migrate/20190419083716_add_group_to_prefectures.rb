class AddGroupToPrefectures < ActiveRecord::Migration[5.2]
  def change

	add_column :prefectures, :group, :string

  end
end
