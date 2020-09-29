class Event < ApplicationRecord
	has_many :users
	# has_many :places
	has_many :event_questions

	has_many :places_events
  	has_many :places, through: :places_events

end
