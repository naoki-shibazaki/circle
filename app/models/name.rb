# == Schema Information
#
# Table name: names
#
#  id         :integer          not null, primary key
#  gender     :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Name < ApplicationRecord
	has_many :name_schedules, dependent: :destroy
  has_many :schedules, through: :name_schedules
  accepts_nested_attributes_for :name_schedules
  validates :name, presence: true
end
