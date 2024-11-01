# == Schema Information
#
# Table name: items
#
#  id            :bigint           not null, primary key
#  check         :string
#  money         :integer
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  collection_id :bigint
#
# Indexes
#
#  index_items_on_collection_id  (collection_id)
#
# Foreign Keys
#
#  fk_rails_...  (collection_id => collections.id)
#
require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
