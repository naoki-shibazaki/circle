class User < ApplicationRecord
	has_many :blogs, dependent: :destroy
	has_many :ages, dependent: :destroy
	belongs_to :prefecture, optional: true
	belongs_to :event, optional: true
	belongs_to :admin_user, optional: true

	with_options presence: true, on: :update do
	  validates :name
	  validates :switch
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
	end

	mount_uploader :pic_profile, ImageUploader
	mount_uploader :pic_header, ImageUploader

end
