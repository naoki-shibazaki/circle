class EventQuestion < ApplicationRecord
	belongs_to :event
	has_many :event_answers, dependent: :destroy
	validates :question, presence: true, length: { in: 1..80 }

	paginates_per 5

end
