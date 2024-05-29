# == Schema Information
#
# Table name: user_contacts
#
#  id            :integer          not null, primary key
#  account_block :string
#  comment       :text
#  contact_del   :string
#  entry         :string
#  ip_address    :string
#  mail          :string
#  message       :text
#  name          :string
#  respond_check :string
#  violation     :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  random_id     :string
#  user_id       :integer
#
# Indexes
#
#  index_user_contacts_on_user_id  (user_id)
#
require 'test_helper'

class UserContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
