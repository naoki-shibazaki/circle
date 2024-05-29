class AddColumnToLinks < ActiveRecord::Migration[5.2]
  def change
  	  	add_belongs_to :links, :user, foreign_key: true

		add_column :links, :unique_id, :string
		add_index :links, :unique_id, unique: true

	  	add_column :links, :link01_title, :string
	  	add_column :links, :link01_url, :string

	  	add_column :links, :link02_title, :string
	  	add_column :links, :link02_url, :string

	  	add_column :links, :link03_title, :string
	  	add_column :links, :link03_url, :string

	  	add_column :links, :link04_title, :string
	  	add_column :links, :link04_url, :string

	  	add_column :links, :link05_title, :string
	  	add_column :links, :link05_url, :string

  end
end