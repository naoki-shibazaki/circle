class CreateMembersEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :members_events do |t|
      t.references :member, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
