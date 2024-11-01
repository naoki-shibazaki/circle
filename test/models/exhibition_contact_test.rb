# == Schema Information
#
# Table name: exhibition_contacts
#
#  id            :bigint           not null, primary key
#  content       :text             not null
#  email         :string           not null
#  name          :string           not null
#  subject       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  exhibition_id :bigint           not null
#
# Indexes
#
#  index_exhibition_contacts_on_exhibition_id  (exhibition_id)
#
# Foreign Keys
#
#  fk_rails_...  (exhibition_id => exhibitions.id)
#
require 'test_helper'

class ExhibitionContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
