class PlacesEvent < ApplicationRecord
  belongs_to :place, optional: true
  belongs_to :event, optional: true
end
