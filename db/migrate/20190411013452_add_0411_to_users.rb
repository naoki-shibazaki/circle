class Add0411ToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image_name, :string
    add_column :users, :line_id, :string
    add_column :users, :switch, :string
    add_column :users, :item, :string
    add_column :users, :prefecture, :string
    add_column :users, :area, :string
    add_column :users, :schedule, :string
    add_column :users, :age, :string
    add_column :users, :recruitment, :string
    add_column :users, :foundation, :string
    add_column :users, :member, :string
    add_column :users, :average_age, :string
    add_column :users, :cost, :string
    add_column :users, :web, :string
    add_column :users, :appeal, :text
    add_column :users, :password, :string
  end
end
