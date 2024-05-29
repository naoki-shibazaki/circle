# == Schema Information
#
# Table name: links
#
#  id           :integer          not null, primary key
#  link01_title :string
#  link01_url   :string
#  link02_title :string
#  link02_url   :string
#  link03_title :string
#  link03_url   :string
#  link04_title :string
#  link04_url   :string
#  link05_title :string
#  link05_url   :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  unique_id    :string
#  user_id      :integer
#
# Indexes
#
#  index_links_on_unique_id  (unique_id) UNIQUE
#  index_links_on_user_id    (user_id)
#
require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
