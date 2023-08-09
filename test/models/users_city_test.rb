# == Schema Information
#
# Table name: users_cities
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  city_id    :integer
#  user_id    :integer
#
require 'test_helper'

class UsersCityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
