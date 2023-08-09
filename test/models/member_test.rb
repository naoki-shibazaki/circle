# == Schema Information
#
# Table name: members
#
#  id                     :integer          not null, primary key
#  age                    :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  gender                 :string
#  image_profile          :string
#  nickname               :string
#  profile                :text
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  prefecture_id          :integer
#  random_id              :string
#
# Indexes
#
#  index_members_on_email                 (email) UNIQUE
#  index_members_on_prefecture_id         (prefecture_id)
#  index_members_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
