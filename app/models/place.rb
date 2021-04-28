class Place < ApplicationRecord
	belongs_to :prefecture
	belongs_to :city
	belongs_to :user, optional: true

  has_many :place_reviews, dependent: :destroy
  has_many :places_events, dependent: :destroy
  has_many :events, through: :places_events

  validates :prefecture_id, presence: true
  validates :event_ids, presence: true

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :tag, presence: true
  validates :address, presence: true

  paginates_per 10

    # Place_検索用
	scope :place_search_word, ->(keyword) do
    where("LOWER(name) LIKE ?", "%#{keyword.downcase}%")
	end

end
