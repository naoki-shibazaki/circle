# == Schema Information
#
# Table name: event_answers
#
#  id                :integer          not null, primary key
#  answer            :text
#  icon              :string
#  nickname          :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  answer_member_id  :string
#  event_question_id :integer
#  member_id         :integer
#
# Indexes
#
#  index_event_answers_on_event_question_id  (event_question_id)
#  index_event_answers_on_member_id          (member_id)
#
class EventAnswer < ApplicationRecord
	belongs_to :event_question
	validates :answer, presence: true

	mount_uploader :icon, ImageUploader
end
