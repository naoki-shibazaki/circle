# == Schema Information
#
# Table name: collections
#
#  id         :integer          not null, primary key
#  day        :string
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_collections_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Collection < ApplicationRecord
	belongs_to :user
	has_many :items, dependent: :destroy

	validates :day, presence: true, date: true

end
