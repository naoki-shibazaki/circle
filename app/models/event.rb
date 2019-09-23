class Event < ApplicationRecord
	has_many :users
	has_many :places
end
