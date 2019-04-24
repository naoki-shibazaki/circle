class User < ApplicationRecord
	has_many :blogs, -> { order('created_at DESC') }
	belongs_to :prefecture, optional: true
	belongs_to :admin_user, optional: true
	# validates :email, {presence: true, uniqueness: true}
	# validates :password, presence: true
end
