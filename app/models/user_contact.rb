# == Schema Information
#
# Table name: user_contacts
#
#  id            :integer          not null, primary key
#  account_block :string
#  comment       :text
#  contact_del   :string
#  entry         :string
#  ip_address    :string
#  mail          :string
#  message       :text
#  name          :string
#  respond_check :string
#  violation     :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  random_id     :string
#  user_id       :integer
#
# Indexes
#
#  index_user_contacts_on_user_id  (user_id)
#
class UserContact < ApplicationRecord
	belongs_to :user

  validates :mail, presence: true, confirmation: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :name, presence: true,
            format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角の日本語（漢字／ひらがな／カタカナ）で入力してください' }

  validates :message, presence: true, length: { maximum: 500, message: 'は500文字以内でお願いします' }
	NGWORD = %w(http 株式会社 弊社 当社 副業 ダイニング 先行予約 割引 ご注文 ヒアリング調査 アンケート調査 ご来場 プレゼント 運営局 開講 当店 飲み放題 アースフレンズ ロッツ横浜)
	NGWORD_REGEX = %r(#{NGWORD.join('|')})
	validates :message, format: { without: NGWORD_REGEX, message: 'にNGワードが含まれています' }

end
