class Schedule < ApplicationRecord
  belongs_to :user
	has_many :name_schedules, dependent: :destroy
  has_many :names, through: :name_schedules
  validates :day, presence: true, date: true
  validates :venue, presence: true
end
