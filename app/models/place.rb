class Place < ApplicationRecord
	belongs_to :prefecture
	belongs_to :city	
	belongs_to :user, optional: true

  	validates :prefecture_id, presence: true
  	validates :city_id, presence: true
  	validates :event_id, presence: true
  	validates :name, presence: true
  	validates :tag, presence: true

end
