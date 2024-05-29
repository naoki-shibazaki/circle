class AddSentCountToUsers < ActiveRecord::Migration[5.2]
  def change

	  	add_column :users, :sent_count, :integer

  end
end
