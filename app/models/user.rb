class User < ApplicationRecord
	has_many :blogs, dependent: :destroy
	has_many :schedules, dependent: :destroy
	has_many :places
	has_many :opinions
	has_many :questions, dependent: :destroy
	has_many :collections, dependent: :destroy
	has_many :reviews, dependent: :destroy
	has_many :users_ages, dependent: :destroy
  	has_many :ages, through: :users_ages
	has_many :users_groups, dependent: :destroy
  	has_many :groups, through: :users_groups
	has_many :users_cities, dependent: :destroy
  	has_many :cities, through: :users_cities

	has_one :match, dependent: :destroy

	belongs_to :prefecture, optional: true
	belongs_to :event, optional: true
	belongs_to :admin_user, optional: true


	with_options presence: true do
	  validates :name
	  validates :event_id
	  validates :prefecture_id
	end

	validates :line_id, {
	  	:allow_blank => true,
	  	:format => /\A#{URI::regexp(%w(http https))}\z/
	}

	validates :web, {
	  	:allow_blank => true,
	  	:format => /\A#{URI::regexp(%w(http https))}\z/
	}

	paginates_per 20
	is_impressionable counter_cache: true
	
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


	# User用
  	scope :user_sort_1, -> {order(switch: :asc, last_post: :desc).where.not(switch: "") }
  	scope :user_sort_2, -> {order(switch: :asc, impressions_count: :desc).where.not(switch: "") }
	scope :user_sort_3, -> {order(switch: :asc, created_at: :desc).where.not(switch: "") }	
  	scope :pref, -> { includes(:prefecture).order("prefectures.sort asc") }
  	scope :user_hide, -> { where.not(switch: "") }
  	scope :user, -> (user_id){ where(id: user_id) }
  	scope :event, -> (event_id){ where(event_id: event_id) }
  	scope :prefecture, -> (prefecture_id){ where(prefecture_id: prefecture_id) }
  	scope :prefecture_sub, -> (prefecture_sub_id){ where(prefecture_sub_id: prefecture_sub_id) }
  	scope :prefecture_50, -> { where(prefecture_id: 50).or(User.where(prefecture_sub_id: 50)) }
 	scope :city, -> (city_id){ where(id: city_id) }

 	# User_検索用
	scope :search_word, ->(keyword) do

		where("name LIKE ?", "%#{keyword}%").
		or(where("schedule LIKE ?", "%#{keyword}%")).
		or(where("area LIKE ?", "%#{keyword}%")).
		or(where("recruitment LIKE ?", "%#{keyword}%")).
		or(where("member LIKE ?", "%#{keyword}%")).
		or(where("cost LIKE ?", "%#{keyword}%")).
		or(where("goal LIKE ?", "%#{keyword}%")).
		or(where("grouping LIKE ?", "%#{keyword}%")).
		or(where("average_age LIKE ?", "%#{keyword}%")).
		or(where("appeal LIKE ?", "%#{keyword}%"))

	end


# event_id　prefecture_id　prefecture_sub_id　
# OK age_ids　group_ids



	# Tag用
  	scope :user_order, -> { includes(:prefecture).order("prefectures.sort asc", switch: :asc, last_post: :desc) }
  	scope :user_sort, -> { user_hide.user_order }

	scope :grouping, ->(group_id) do
	  where("grouping LIKE ?", "%#{group_id}%")
	end

	scope :average_age, ->(age_id) do
	  where("average_age LIKE ?", "%#{age_id}%")
	end


end
