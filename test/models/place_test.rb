# == Schema Information
#
# Table name: places
#
#  id                  :integer          not null, primary key
#  access              :string
#  address             :string
#  average_access      :float
#  average_facility    :float
#  average_price       :float
#  average_reservation :float
#  average_score       :float
#  img_link            :string
#  img_source          :string
#  img_url             :string
#  name                :string
#  parking             :string
#  price               :string
#  regular_holiday     :string
#  scale               :string
#  sns                 :text
#  tag                 :string
#  tel                 :string
#  time                :string
#  url                 :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  city_id             :integer
#  event_id            :integer
#  prefecture_id       :integer
#  user_id             :integer
#
require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
