class EventQuestion < ApplicationRecord
	belongs_to :event
	has_many :event_answers, dependent: :destroy
	# has_many :members
	validates :question, presence: true, length: { in: 1..80 }
end
