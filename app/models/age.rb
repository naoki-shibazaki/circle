# == Schema Information
#
# Table name: ages
#
#  id         :bigint           not null, primary key
#  decade     :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Age < ApplicationRecord
	has_many :users_ages
  has_many :users, through: :users_ages
end
