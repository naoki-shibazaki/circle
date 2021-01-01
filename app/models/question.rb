class Question < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { in: 1..80 }

	NGWORD = %w(http 死ね 京築リーグ)
	NGWORD_REGEX = %r(#{NGWORD.join('|')})
	validates :content, format: { without: NGWORD_REGEX }


  paginates_per 20
end