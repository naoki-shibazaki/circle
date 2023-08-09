# == Schema Information
#
# Table name: users_ages
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  age_id     :integer
#  user_id    :integer
#
require 'test_helper'

class UsersAgeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
