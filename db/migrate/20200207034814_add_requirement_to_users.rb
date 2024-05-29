class AddRequirementToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :requirement, :text
  end
end
