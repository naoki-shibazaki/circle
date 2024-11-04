class AddPointsAndLastGetPointAtToMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :points, :integer, default: 0, null: false
    add_column :members, :last_get_point_at, :datetime, null: true
  end
end
