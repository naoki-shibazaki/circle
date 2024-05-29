# == Schema Information
#
# Table name: places_events
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :integer
#  place_id   :integer
#
# Indexes
#
#  index_places_events_on_event_id  (event_id)
#  index_places_events_on_place_id  (place_id)
#
# Foreign Keys
#
#  event_id  (event_id => events.id)
#  place_id  (place_id => places.id)
#
class PlacesEvent < ApplicationRecord
  belongs_to :place, optional: true
  belongs_to :event, optional: true
end