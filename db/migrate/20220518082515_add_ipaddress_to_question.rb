class AddIpaddressToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :ip_address, :string
  end
end
