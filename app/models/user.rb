class User < ApplicationRecord
	has_many :blogs, dependent: :destroy
	belongs_to :prefecture, optional: true
	belongs_to :admin_user, optional: true
	# validates :email, {presence: true, uniqueness: true}
	# validates :password, presence: true
	with_options presence: true, on: :update do
	  validates :name
	  validates :switch
	  validates :item
	  validates :prefecture_id
	end
	
end


# , -> { order('created_at DESC') }