# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  category   :string
#  name       :string
#  order      :string
#  tag        :string
#  text       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tag < ApplicationRecord
	has_many :user_tags
  has_many :users, through: :user_tags
end
