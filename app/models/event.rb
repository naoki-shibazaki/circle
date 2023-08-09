# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  category    :string
#  icon        :string
#  matching    :integer
#  name        :string
#  openchat    :string
#  order       :string
#  place       :integer
#  ruby        :string
#  txt         :string
#  users_count :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :string
#
class Event < ApplicationRecord
	belongs_to :category

	has_many :users
	has_many :event_questions

	has_many :places_events
  has_many :places, through: :places_events
	has_many :members_events
  has_many :members, through: :members_events

end
