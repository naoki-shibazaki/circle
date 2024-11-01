# == Schema Information
#
# Table name: opinions
#
#  id         :bigint           not null, primary key
#  opinion    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_opinions_on_user_id  (user_id)
#
class Opinion < ApplicationRecord
	belongs_to :user, optional: true

	with_options presence: true do
	  validates :opinion
	end

end
