# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  group      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Group < ApplicationRecord
	has_many :users_groups
  has_many :users, through: :users_groups
end
