class Event < ApplicationRecord
	has_many :users
	has_many :places
	has_many :event_questions	
end
