class Schedule < ApplicationRecord
  belongs_to :user
  validates :day, presence: true
end
