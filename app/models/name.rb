class Name < ApplicationRecord
	has_many :name_schedules, dependent: :destroy
  has_many :schedules, through: :name_schedules
  validates :name, presence: true
end
