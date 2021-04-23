class AddAverageScoreToPalces < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :average_facility, :float
    add_column :places, :average_reservation, :float
    add_column :places, :average_price, :float
    add_column :places, :average_access, :float
    add_column :places, :average_score, :float
  end
end
