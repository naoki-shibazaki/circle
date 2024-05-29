# == Schema Information
#
# Table name: matches
#
#  id         :integer          not null, primary key
#  age_group  :string
#  comment    :text
#  level      :string
#  member     :string
#  recruit    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_matches_on_user_id  (user_id)
#
require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
