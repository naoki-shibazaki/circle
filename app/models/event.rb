class Event < ApplicationRecord
	belongs_to :category

	has_many :users
	has_many :event_questions

	has_many :places_events
  has_many :places, through: :places_events
	has_many :members_events
  has_many :members, through: :members_events

end
