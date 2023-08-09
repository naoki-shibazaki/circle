# == Schema Information
#
# Table name: differences
#
#  id         :integer          not null, primary key
#  combine    :text
#  dummy      :string
#  letter     :string
#  order      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Difference < ApplicationRecord

	validates :letter, presence: true, length: { maximum: 1 }
	validates :dummy, presence: true, length: { maximum: 1 }	
	validates :order, presence: true, :numericality => { :less_than_or_equal_to => 308 }

	paginates_per 10

end
