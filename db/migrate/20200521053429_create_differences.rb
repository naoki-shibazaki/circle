class CreateDifferences < ActiveRecord::Migration[5.2]
  def change
    create_table :differences do |t|
      t.string :letter
      t.string :dummy
      t.string :order
      t.text :combine

      t.timestamps
    end
  end
end
