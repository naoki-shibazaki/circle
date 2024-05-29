# == Schema Information
#
# Table name: users_groups
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer
#  user_id    :integer
#
require 'test_helper'

class UsersGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
