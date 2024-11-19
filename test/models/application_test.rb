# == Schema Information
#
# Table name: applications
#
#  id          :bigint           not null, primary key
#  applied_at  :datetime         not null
#  points_used :integer          default(30), not null
#  status      :string           default("pending")
#  won_at      :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  member_id   :bigint           not null
#
# Indexes
#
#  index_applications_on_member_id  (member_id)
#
# Foreign Keys
#
#  fk_rails_...  (member_id => members.id)
#
require 'test_helper'

class ApplicationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
