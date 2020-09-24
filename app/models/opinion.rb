class Opinion < ApplicationRecord
	belongs_to :user, optional: true

	with_options presence: true do
	  validates :opinion
	end

end
