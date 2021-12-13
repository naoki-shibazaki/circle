class AddPointToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :point, :string
  end
end
