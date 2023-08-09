# == Schema Information
#
# Table name: account_blocks
#
#  id         :integer          not null, primary key
#  block      :integer          default(0), not null
#  ip_address :string
#  model      :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class AccountBlockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
