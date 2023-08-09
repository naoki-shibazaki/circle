# == Schema Information
#
# Table name: schedules
#
#  id                  :integer          not null, primary key
#  cost                :string
#  date                :string
#  day                 :string
#  google_map          :string
#  member_venue        :string
#  note                :text
#  recruitment         :string
#  recruitment_numbers :integer
#  time_e              :time
#  time_s              :time
#  title               :string
#  top_image           :string
#  venue               :string
#  venue_address       :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :integer
#
# Indexes
#
#  index_schedules_on_user_id  (user_id)
#
require 'test_helper'

class ScheduleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
