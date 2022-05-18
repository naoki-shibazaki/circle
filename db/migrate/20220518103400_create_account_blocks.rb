class CreateAccountBlocks < ActiveRecord::Migration[5.2]
  def change
    create_table :account_blocks do |t|

      t.timestamps
    end
  end
end
