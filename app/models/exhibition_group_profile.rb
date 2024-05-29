# == Schema Information
#
# Table name: exhibition_group_profiles
#
#  id                     :integer          not null, primary key
#  header_img             :string
#  introduction           :text
#  name                   :string           not null
#  profile_img            :string
#  web_url                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  exhibition_category_id :integer          not null
#  exhibition_group_id    :integer          not null
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
#  exhibition_category_id  (exhibition_category_id => exhibition_categories.id)
#  exhibition_group_id     (exhibition_group_id => exhibition_groups.id)
#
class ExhibitionGroupProfile < ApplicationRecord

  belongs_to :exhibition_group
  belongs_to :exhibition_category

	mount_uploader :profile_img, ImageUploader
	mount_uploader :header_img, ImageUploader

	validates :web_url, {
    :allow_blank => true,
    :format => /\A#{URI::regexp(%w(http https))}\z/
	}

  def exhibitions
    self.exhibition_group.exhibitions
  end

end
