# == Schema Information
#
# Table name: cities
#
#  id            :integer          not null, primary key
#  city_kana     :string
#  name          :string
#  places_count  :integer          default(0), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  prefecture_id :string
#
require 'test_helper'

class CityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
