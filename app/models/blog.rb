class Blog < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :user_id, presence: true

	mount_uploader :image_01, ImageUploader
	mount_uploader :image_02, ImageUploader
	mount_uploader :image_03, ImageUploader
	mount_uploader :image_04, ImageUploader


end
