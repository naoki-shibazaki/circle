class City < ApplicationRecord
	belongs_to :prefecture

	has_many :users_cities
  has_many :users, through: :users_cities
  has_many :stations
end
