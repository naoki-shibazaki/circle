class CreateDbKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :db_keywords do |t|
      t.string :keyword

      t.timestamps
    end
  end
end
