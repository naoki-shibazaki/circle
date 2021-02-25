class Review < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :member, optional: true


	with_options presence: true do
    validates :comment
	end

	NGWORD = %w(http 死ね)
	NGWORD_REGEX = %r(#{NGWORD.join('|')})
	validates :comment, format: { without: NGWORD_REGEX }


end
