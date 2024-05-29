class AddImgToPlaces < ActiveRecord::Migration[5.2]
  def change
		add_column :places, :img_link, :string
		add_column :places, :img_url, :string
		add_column :places, :img_source, :string
  end
end
