class AddLivingAddressToMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :living_prefecture_id, :integer, null: true, after: :prefecture_id, comment: '現住所: 都道府県'
    add_column :members, :living_city, :string, null: true, after: :living_prefecture_id, comment: '現住所: 市区町村'
    add_column :members, :living_address, :string, null: true, after: :living_city, comment: '現住所: 以下住所'
  end
end
