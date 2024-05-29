# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  age               :string
#  appeal            :text
#  area              :string
#  average_age       :string
#  cb_point          :float            default(0.0), not null
#  contact           :string
#  cost              :string
#  decade_age        :integer
#  email             :string
#  failed_attempts   :integer          default(0), not null
#  foundation        :string
#  gallery_01        :string
#  gallery_02        :string
#  gallery_03        :string
#  gallery_04        :string
#  goal              :string
#  grouping          :string
#  header_image      :string
#  image_name        :string
#  impressions_count :integer          default(0)
#  instagram         :string
#  item              :string
#  last_post         :string
#  line_count        :integer          default(0)
#  locked_at         :datetime
#  mail_count        :integer          default(0)
#  member            :string
#  name              :string
#  ng_account        :string
#  password          :string
#  pic_header        :string
#  pic_profile       :string
#  point             :string
#  prefecture        :string
#  recruitment       :string
#  requirement       :text
#  review_permit     :boolean          default(TRUE)
#  review_score      :string
#  schedule          :string
#  sent_count        :integer
#  switch            :string
#  template          :text
#  twitter           :string
#  unlock_token      :string
#  user_time         :string
#  web               :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  admin_user_id     :integer
#  category_id       :string
#  event_id          :integer
#  line_id           :string
#  prefecture_id     :integer
#  prefecture_sub_id :integer
#  unique_id         :string
#  user_id           :string
#
# Indexes
#
#  index_users_on_admin_user_id  (admin_user_id)
#  index_users_on_prefecture_id  (prefecture_id)
#  index_users_on_unlock_token   (unlock_token) UNIQUE
#
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
