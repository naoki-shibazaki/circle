class AddDecadeAgeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :decade_age, :integer
  end
end
