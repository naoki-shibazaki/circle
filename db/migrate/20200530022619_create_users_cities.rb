class CreateUsersCities < ActiveRecord::Migration[5.2]
  def change
    create_table :users_cities do |t|
      t.integer  :user_id
      t.integer  :city_id
      t.timestamps null: false
    end
  end
end
