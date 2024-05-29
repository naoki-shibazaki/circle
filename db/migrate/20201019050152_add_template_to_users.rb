class AddTemplateToUsers < ActiveRecord::Migration[5.2]
  def change

  	add_column :users, :template, :text

  end
end
