class Exhibition < ApplicationRecord

  belongs_to :prefecture

  has_many :exhibition_contacts, dependent: :destroy

	mount_uploader :header_img, ImageUploader
	mount_uploader :gallery_img_01, ImageUploader
	mount_uploader :gallery_img_02, ImageUploader
	mount_uploader :gallery_img_03, ImageUploader
	mount_uploader :gallery_img_04, ImageUploader

	with_options presence: true do
    validates :name
    validates :event_date
    validates :end_date
    validates :name
  end



end
