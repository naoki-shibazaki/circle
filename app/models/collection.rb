class Collection < ApplicationRecord
	belongs_to :user
	has_many :items, dependent: :destroy

	validates :day, presence: true
	validates :price, numericality: true

end
