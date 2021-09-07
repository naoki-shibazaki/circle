class Attendance < ApplicationRecord
  belongs_to :schedule
  belongs_to :member, optional: true
end
