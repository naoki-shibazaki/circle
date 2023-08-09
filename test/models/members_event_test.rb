# == Schema Information
#
# Table name: members_events
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :integer
#  member_id  :integer
#
# Indexes
#
#  index_members_events_on_event_id   (event_id)
#  index_members_events_on_member_id  (member_id)
#
# Foreign Keys
#
#  event_id   (event_id => events.id)
#  member_id  (member_id => members.id)
#
require 'test_helper'

class MembersEventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
