# == Schema Information
#
# Table name: place_reviews
#
#  id            :integer          not null, primary key
#  access        :float
#  average_score :float
#  comment       :text
#  facility      :float
#  ip_address    :string
#  price         :float
#  reservation   :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  event_id      :integer
#  place_id      :integer
#
# Indexes
#
#  index_place_reviews_on_place_id  (place_id)
#
class PlaceReview < ApplicationRecord
  belongs_to :place

	with_options presence: true do
    validates :price
    validates :facility
    validates :access
    validates :reservation
    validates :comment
	end

	NGWORD = %w(http 死ね)
	NGWORD_REGEX = %r(#{NGWORD.join('|')})
	validates :comment, format: { without: NGWORD_REGEX }


end
