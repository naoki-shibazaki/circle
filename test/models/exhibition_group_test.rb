# == Schema Information
#
# Table name: exhibition_groups
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_exhibition_groups_on_email                 (email) UNIQUE
#  index_exhibition_groups_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'test_helper'

class ExhibitionGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
