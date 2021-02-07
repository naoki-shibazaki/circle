class ChangeNgAccountOfUsers < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :users, :ng_account, :string, default: 'OK'
    end

    def down
      change_column :users, :ng_account, :string
    end
  end
end
