class AddGenderToNames < ActiveRecord::Migration[5.2]
  def change
    add_column :names, :gender, :integer
  end
end