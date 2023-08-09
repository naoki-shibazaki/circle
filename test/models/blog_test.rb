# == Schema Information
#
# Table name: blogs
#
#  id                 :integer          not null, primary key
#  blog_image_name    :string
#  content            :text
#  image_01           :string
#  image_02           :string
#  image_03           :string
#  image_04           :string
#  impressions_count  :integer          default(0)
#  photo              :string
#  photo_content_type :string
#  photo_file_name    :string
#  photo_file_size    :string
#  photo_updated_at   :string
#  title              :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#
# Indexes
#
#  index_blogs_on_user_id  (user_id)
#
require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
