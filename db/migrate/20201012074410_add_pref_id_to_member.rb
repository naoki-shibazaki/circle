class AddPrefIdToMember < ActiveRecord::Migration[5.2]
  def change
  	add_reference :members, :prefecture, index: true
  end
end
