class Schedule < ApplicationRecord
  has_many :attendances, dependent: :destroy
  belongs_to :user
  validates :day, presence: true, date: true
  validates :venue, presence: true
end
