# == Schema Information
#
# Table name: exhibition_categories
#
#  id           :integer          not null, primary key
#  display_name :string
#  kana         :string
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class ExhibitionCategory < ApplicationRecord

  has_many :exhibition_group_profiles

end
