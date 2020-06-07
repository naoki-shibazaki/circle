class Tag < ApplicationRecord

  	scope :user_hide, -> { where.not(switch: "") }
  	scope :user_order, -> { includes(:prefecture).order("prefectures.sort asc", last_post: :desc) }
  	scope :user_sort, -> { user_hide.user_order }

  	scope :event, -> (event_id){ where(event_id: event_id) }
  	scope :prefecture, -> (prefecture_id){ where(prefecture_id: prefecture_id) }
  	scope :prefecture_sub, -> (prefecture_sub_id){ where(prefecture_sub_id: prefecture_sub_id) }
  	scope :prefecture_50, -> { where(prefecture_id: 50).or(User.where(prefecture_sub_id: 50)) }
 	scope :city, -> (city_id){ where(id: city_id) }




end
