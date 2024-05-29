class AddColumnToAccountBlock < ActiveRecord::Migration[5.2]
  def change
    add_column :account_blocks, :ip_address, :string
    add_column :account_blocks, :block, :integer, null: false, default: 0
    add_column :account_blocks, :model, :string
    add_column :account_blocks, :url, :string
  end
end
