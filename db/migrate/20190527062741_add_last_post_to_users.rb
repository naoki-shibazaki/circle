class AddLastPostToUsers < ActiveRecord::Migration[5.2]
  def change
	add_column :users, :last_post, :string
  end
end
