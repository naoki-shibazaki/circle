class Review < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :member, optional: true

	NGWORD = %w(http 死ね bit й л com link)
	NGWORD_REGEX = %r(#{NGWORD.join('|')})
  validates :comment,
    format: { without: NGWORD_REGEX },
    length: { minimum: 5 }

end
