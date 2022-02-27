class AddTopImageToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :cost, :string
    add_column :schedules, :top_image, :string
  end
end
