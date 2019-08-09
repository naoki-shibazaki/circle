class Schedule < ApplicationRecord
  belongs_to :user
  validates :day, presence: true
  validates :venue, presence: true
end
