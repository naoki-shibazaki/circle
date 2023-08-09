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
require 'test_helper'

class DifferenceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
