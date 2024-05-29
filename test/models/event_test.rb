# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  category    :string
#  icon        :string
#  matching    :integer
#  name        :string
#  openchat    :string
#  order       :string
#  place       :integer
#  ruby        :string
#  txt         :string
#  users_count :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :string
#
require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
