class CreateApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :applications do |t|
      t.references :member, null: false, foreign_key: true
      t.timestamp :applied_at, null: false
      t.string :status, default: 'pending' # 応募の状態: pending, won, lost
      t.timestamp :won_at # 当選日時
      t.integer :points_used, null: false, default: 30 # 使用したポイント

      t.timestamps
    end
  end
end
