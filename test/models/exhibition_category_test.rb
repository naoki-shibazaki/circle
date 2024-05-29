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
require 'test_helper'

class ExhibitionCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
