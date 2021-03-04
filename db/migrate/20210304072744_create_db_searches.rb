class CreateDbSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :db_searches do |t|
      t.string :keyword

      t.timestamps
    end
  end
end
