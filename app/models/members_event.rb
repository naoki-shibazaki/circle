# == Schema Information
#
# Table name: members_events
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :bigint
#  member_id  :bigint
#
# Indexes
#
#  index_members_events_on_event_id   (event_id)
#  index_members_events_on_member_id  (member_id)
#
# Foreign Keys
#
#  fk_rails_...  (event_id => events.id)
#  fk_rails_...  (member_id => members.id)
#
class MembersEvent < ApplicationRecord
  belongs_to :member
  belongs_to :event
end
