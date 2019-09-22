class AddColumnToPlaces < ActiveRecord::Migration[5.2]
  def change
		add_column :places, :user_id, :string
		add_column :places, :prefecture_id, :string
		add_column :places, :city_id, :string
		add_column :places, :event_id, :string
		add_column :places, :name, :string
		add_column :places, :address, :string
		add_column :places, :access, :string
		add_column :places, :tag, :string
		add_column :places, :parking, :string
		add_column :places, :time, :string
		add_column :places, :regular_holiday, :string
		add_column :places, :scale, :string
		add_column :places, :price, :string
		add_column :places, :tel, :string
		add_column :places, :url, :string
  end
end



