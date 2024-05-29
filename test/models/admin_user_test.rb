# == Schema Information
#
# Table name: admin_users
#
#  id                     :integer          not null, primary key
#  age                    :string
#  check                  :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  gender                 :string
#  image_profile          :string
#  nickname               :string
#  open                   :integer          default(0), not null
#  profile                :text
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  prefecture_id          :integer
#
# Indexes
#
#  index_admin_users_on_email                 (email) UNIQUE
#  index_admin_users_on_prefecture_id         (prefecture_id)
#  index_admin_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'test_helper'

class AdminUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
