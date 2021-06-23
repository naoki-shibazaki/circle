class ChangeCityIdToPlace < ActiveRecord::Migration[5.2]

  def up
    # 環境ごとにマイグレーションを分ける
    if Rails.env.development? || Rails.env.test?
      change_column :places, :city_id, :integer
      change_column :places, :event_id, :integer
      change_column :places, :user_id, :integer
    else Rails.env.production?
      # 本番環境はusingオプションを追加
      change_column :places, :city_id, 'integer USING CAST(city_id AS integer)'
      change_column :places, :event_id, 'integer USING CAST(event_id AS integer)'
      change_column :places, :user_id, 'integer USING CAST(user_id AS integer)'
    end
  end

  def down
    change_column :places, :city_id, :string
    change_column :places, :event_id, :string
    change_column :places, :user_id, :string
  end

end
