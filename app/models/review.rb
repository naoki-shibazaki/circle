class Review < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :member, optional: true


	with_options presence: true do
	  validates :comment
	end


end
