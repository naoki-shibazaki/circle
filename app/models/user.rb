class User < ApplicationRecord
	has_many :blogs, dependent: :destroy
	has_many :ages, dependent: :destroy
	belongs_to :prefecture, optional: true
	belongs_to :event, optional: true
	belongs_to :admin_user, optional: true

	with_options presence: true, on: :update do
	  validates :name
	  validates :switch
	  validates :event_id
	  validates :prefecture_id
	end
	
end


# , -> { order('created_at DESC') }