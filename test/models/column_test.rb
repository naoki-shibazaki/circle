# == Schema Information
#
# Table name: columns
#
#  id          :integer          not null, primary key
#  description :text
#  image       :string
#  text        :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'test_helper'

class ColumnTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
