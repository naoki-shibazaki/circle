# == Schema Information
#
# Table name: prefectures
#
#  id           :integer          not null, primary key
#  group        :string
#  kana         :string
#  name         :string
#  order        :string
#  places_count :integer          default(0), not null
#  sort         :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Prefecture < ApplicationRecord
	has_many :users
	has_many :members
	has_many :admin_users
  has_many :places
  has_many :exhibitions
  has_many :cities, ->{ order(:id) }
end
