# == Schema Information
#
# Table name: place_reviews
#
#  id            :integer          not null, primary key
#  access        :float
#  average_score :float
#  comment       :text
#  facility      :float
#  ip_address    :string
#  price         :float
#  reservation   :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  event_id      :integer
#  place_id      :integer
#
# Indexes
#
#  index_place_reviews_on_place_id  (place_id)
#
require 'test_helper'

class PlaceReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
