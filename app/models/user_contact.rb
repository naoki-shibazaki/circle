class UserContact < ApplicationRecord
	belongs_to :user

  validates :mail, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }

  validates :message, presence: true
	NGWORD = %w(http 株式会社)
	NGWORD_REGEX = %r(#{NGWORD.join('|')})
	validates :message, format: { without: NGWORD_REGEX }

end