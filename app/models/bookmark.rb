class Bookmark < ApplicationRecord
  belongs_to :member
  belongs_to :user

  validates :member_id, uniqueness: { scope: :user_id }

end
