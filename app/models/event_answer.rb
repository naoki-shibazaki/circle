class EventAnswer < ApplicationRecord
	belongs_to :event_question
	validates :answer, presence: true
end
