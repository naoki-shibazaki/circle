class Place < ApplicationRecord
	belongs_to :prefecture
	belongs_to :city
	belongs_to :user, optional: true

  has_many :places_events
  has_many :events, through: :places_events

  validates :prefecture_id, presence: true
  validates :event_ids, presence: true

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :tag, presence: true
  validates :address, presence: true

  paginates_per 20


end
