class EventQuestion < ApplicationRecord
	belongs_to :event
	has_many :event_answers	
	# has_many :members
	validates :question, presence: true, length: { in: 1..80 }
end
