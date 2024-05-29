class AddTxtToEvents < ActiveRecord::Migration[5.2]
  def change
  	add_column :events, :txt, :string
  end
end
