# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  kana       :string
#  name       :string
#  order      :string
#  txt        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
	has_many :events, ->{ order(:order) }
end
