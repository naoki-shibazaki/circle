class UserContact < ApplicationRecord
	belongs_to :user

  validates :mail, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :message, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }

end
