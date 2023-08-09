# == Schema Information
#
# Table name: cities
#
#  id            :integer          not null, primary key
#  city_kana     :string
#  name          :string
#  places_count  :integer          default(0), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  prefecture_id :string
#
class City < ApplicationRecord
	belongs_to :prefecture

	has_many :users_cities
  has_many :users, through: :users_cities
  has_many :stations
end
