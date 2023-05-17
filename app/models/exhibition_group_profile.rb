class ExhibitionGroupProfile < ApplicationRecord

  belongs_to :exhibition_group
  belongs_to :exhibition_category

	mount_uploader :profile_img, ImageUploader
	mount_uploader :header_img, ImageUploader

	validates :web_url, {
    :allow_blank => true,
    :format => /\A#{URI::regexp(%w(http https))}\z/
	}

end
