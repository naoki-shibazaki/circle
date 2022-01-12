class AddSearchCountToDbKeywords < ActiveRecord::Migration[5.2]
  def change
    add_column :db_keywords, :search_count, :integer, null: false, default: 0
  end
end
