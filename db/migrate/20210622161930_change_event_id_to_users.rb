class ChangeEventIdToUsers < ActiveRecord::Migration[5.2]

  def up
    # 環境ごとにマイグレーションを分ける
    if Rails.env.development? || Rails.env.test?
      change_column :users, :event_id, :integer
    else Rails.env.production?
      # 本番環境はusingオプションを追加
      change_column :users, :event_id, 'integer USING CAST(event_id AS integer)'
    end
  end

  def down
    change_column :users, :event_id, :string
  end

end
