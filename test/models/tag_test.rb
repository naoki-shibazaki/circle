# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  category   :string
#  name       :string
#  order      :string
#  tag        :string
#  text       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class TagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
