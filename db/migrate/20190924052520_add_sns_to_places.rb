class AddSnsToPlaces < ActiveRecord::Migration[5.2]
  def change
		add_column :places, :sns, :text
  end
end
