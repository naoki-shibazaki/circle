# == Schema Information
#
# Table name: stations
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  city_id    :string
#
class Station < ApplicationRecord
	belongs_to :city

end
