# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  age        :string
#  comment    :text
#  gender     :string
#  ip         :string
#  nickname   :string
#  review     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  member_id  :integer
#  user_id    :integer
#
# Indexes
#
#  index_reviews_on_member_id  (member_id)
#  index_reviews_on_user_id    (user_id)
#
# Foreign Keys
#
#  member_id  (member_id => members.id)
#  user_id    (user_id => users.id)
#
class Review < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :member, optional: true

	NGWORD = %w(http 死ね bit й л com link)
	NGWORD_REGEX = %r(#{NGWORD.join('|')})
  validates :comment,
    format: { without: NGWORD_REGEX },
    length: { minimum: 6 }

end
