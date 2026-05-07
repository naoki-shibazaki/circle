class AddPerformanceIndexes < ActiveRecord::Migration[6.0]
  def change
    # Join tables（インデックスなし → 全テーブルスキャン）
    add_index :users_ages,   :user_id
    add_index :users_ages,   :age_id
    add_index :users_cities, :user_id
    add_index :users_cities, :city_id
    add_index :users_groups, :user_id
    add_index :users_groups, :group_id
    add_index :likes,        :user_id
    add_index :likes,        :blog_id

    # users テーブル：頻繁に WHERE/ORDER で使われる列
    add_index :users, :event_id
    add_index :users, :ng_account
    add_index :users, :switch
    add_index :users, :prefecture_sub_id
    add_index :users, :last_post
  end
end
