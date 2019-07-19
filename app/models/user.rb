class User < ApplicationRecord
	has_many :blogs, dependent: :destroy
	belongs_to :ages, optional: true
	belongs_to :prefecture, optional: true
	belongs_to :event, optional: true
	belongs_to :admin_user, optional: true, dependent: :destroy

	with_options presence: true, on: :update do
	  validates :name
	  validates :event_id
	  validates :prefecture_id
	end

	validates :line_id, {
	  	:allow_blank => true,
	  	:format => URI::regexp(%w(http https)),
	}

	validates :web, {
	  	:allow_blank => true,
	  	:format => URI::regexp(%w(http https)),
	}

	paginates_per 10
	
	before_save do
		self.average_age.gsub!(/[\[\]\"]/, "") if attribute_present?("average_age")
		self.grouping.gsub!(/[\[\]\"]/, "") if attribute_present?("grouping")
	end

	mount_uploader :pic_profile, ImageUploader
	mount_uploader :pic_header, ImageUploader
	mount_uploader :gallery_01, ImageUploader
	mount_uploader :gallery_02, ImageUploader
	mount_uploader :gallery_03, ImageUploader
	mount_uploader :gallery_04, ImageUploader

end
