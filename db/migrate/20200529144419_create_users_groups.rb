class CreateUsersGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :users_groups do |t|
      t.integer  :user_id
      t.integer  :group_id
      t.timestamps null: false
    end
  end
end
