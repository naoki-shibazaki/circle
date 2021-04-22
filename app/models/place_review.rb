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
