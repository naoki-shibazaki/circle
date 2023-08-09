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
require 'test_helper'

class EventQuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
