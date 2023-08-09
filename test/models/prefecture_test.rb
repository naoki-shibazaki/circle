# == Schema Information
#
# Table name: prefectures
#
#  id           :integer          not null, primary key
#  group        :string
#  kana         :string
#  name         :string
#  order        :string
#  places_count :integer          default(0), not null
#  sort         :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'test_helper'

class PrefectureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
