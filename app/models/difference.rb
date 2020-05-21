class Difference < ApplicationRecord

	validates :letter, presence: true, length: { maximum: 1 }
	validates :dummy, presence: true, length: { maximum: 1 }	
	validates :order, presence: true, :numericality => { :less_than_or_equal_to => 308 }

	paginates_per 10

end
