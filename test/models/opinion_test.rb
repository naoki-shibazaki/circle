# == Schema Information
#
# Table name: opinions
#
#  id         :integer          not null, primary key
#  opinion    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_opinions_on_user_id  (user_id)
#
require 'test_helper'

class OpinionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
