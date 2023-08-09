# == Schema Information
#
# Table name: db_validation_errors
#
#  id         :integer          not null, primary key
#  content_01 :text
#  content_02 :text
#  content_03 :text
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class DbValidationErrorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
