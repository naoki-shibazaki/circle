class UserContact < ApplicationRecord
	belongs_to :user

  validates :mail, presence: true, confirmation: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :name, presence: true,
            format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角の日本語（漢字／ひらがな／カタカナ）で入力してください' }

  validates :message, presence: true, length: { maximum: 500, message: 'は500文字以内でお願いします' }
	NGWORD = %w(http 株式会社 弊社 副業 ダイニング 先行予約 割引 ヒアリング調査 アンケート調査 ご来場 プレゼント 運営局 開講 アースフレンズ ロッツ横浜)
	NGWORD_REGEX = %r(#{NGWORD.join('|')})
	validates :message, format: { without: NGWORD_REGEX, message: 'にNGワードが含まれています' }

end