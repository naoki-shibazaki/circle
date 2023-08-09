# == Schema Information
#
# Table name: ages
#
#  id         :integer          not null, primary key
#  decade     :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class AgeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
