# == Schema Information
#
# Table name: exhibition_group_profiles
#
#  id                     :bigint           not null, primary key
#  header_img             :string
#  introduction           :text
#  name                   :string           not null
#  profile_img            :string
#  web_url                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  exhibition_category_id :bigint           not null
#  exhibition_group_id    :bigint           not null
#  instagram_id           :string
#  twitter_id             :string
#
# Indexes
#
#  index_exhibition_group_profiles_on_exhibition_category_id  (exhibition_category_id)
#  index_exhibition_group_profiles_on_exhibition_group_id     (exhibition_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (exhibition_category_id => exhibition_categories.id)
#  fk_rails_...  (exhibition_group_id => exhibition_groups.id)
#
require 'test_helper'

class ExhibitionGroupProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
