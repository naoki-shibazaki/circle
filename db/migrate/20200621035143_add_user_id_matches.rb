class AddUserIdMatches < ActiveRecord::Migration[5.2]
  def change
  	  	add_belongs_to :matches, :user, foreign_key: true
  end
end
