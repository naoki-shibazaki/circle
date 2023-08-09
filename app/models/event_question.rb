# == Schema Information
#
# Table name: event_questions
#
#  id         :integer          not null, primary key
#  question   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :integer
#
# Indexes
#
#  index_event_questions_on_event_id  (event_id)
#
class EventQuestion < ApplicationRecord
	belongs_to :event
	has_many :event_answers, dependent: :destroy
	validates :question, presence: true, length: { in: 1..80 }

	paginates_per 5

end
