class AddUserIdOpinions < ActiveRecord::Migration[5.2]
  def change
  	add_reference :opinions, :user, index: true
  end
end
