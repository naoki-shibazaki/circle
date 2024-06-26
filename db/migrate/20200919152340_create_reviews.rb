class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :member, foreign_key: true
      t.text :comment
      t.integer :review

      t.timestamps
    end
  end
end
