# == Schema Information
#
# Table name: db_keywords
#
#  id           :integer          not null, primary key
#  keyword      :string
#  search_count :integer          default(0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'test_helper'

class DbKeywordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
