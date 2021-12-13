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
	has_many :user_tags, dependent: :destroy
  has_many :tags, through: :user_tags
  has_many :bookmarks, dependent: :destroy
	has_many :user_contacts, dependent: :destroy


	has_one :match, dependent: :destroy
	has_one :link, dependent: :destroy

	belongs_to :prefecture
	belongs_to :category, optional: true
	belongs_to :event
  counter_culture :event, column_name: 'users_count'
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

	NGWORD = %w(http)
	NGWORD_REGEX = %r(#{NGWORD.join('|')})
	validates :template, format: { without: NGWORD_REGEX }

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
  scope :ng_account, -> {where(ng_account: nil).or(User.where(ng_account: "OK"))}
  scope :user_sort_1, -> {ng_account.order(switch: :asc, last_post: :desc).where.not(switch: "") }
  scope :user_sort_2, -> {ng_account.order(switch: :asc, point: :desc).where.not(switch: "") }
  scope :user_sort_3, -> {ng_account.order(switch: :asc, created_at: :desc).where.not(switch: "") }
  scope :pref, -> { includes(:prefecture).order("prefectures.sort asc") }
  scope :user, -> (user_id){ where(id: user_id) }
  scope :event, -> (event_id){ where(event_id: event_id) }
  scope :prefecture, -> (prefecture_id){ where(prefecture_id: prefecture_id) }
  scope :prefecture_sub, -> (prefecture_sub_id){ where(prefecture_sub_id: prefecture_sub_id) }
  scope :prefecture_50, -> { where(prefecture_id: 50).or(User.where(prefecture_sub_id: 50)) }
  scope :city, -> (city_id){ where(id: city_id) }
  scope :tag, -> (tag_id){ where(id: tag_id) }

  # Blog用
  scope :user_hide, -> { ng_account.where.not(switch: "") }

  # User_検索用
	scope :search_word, ->(keyword) do
    where("LOWER(name) LIKE ?", "%#{keyword.downcase}%").
		or(where("schedule LIKE ?", "%#{keyword}%")).
		or(where("area LIKE ?", "%#{keyword}%")).
		or(where("recruitment LIKE ?", "%#{keyword}%")).
		or(where("member LIKE ?", "%#{keyword}%")).
		or(where("cost LIKE ?", "%#{keyword}%")).
		or(where("goal LIKE ?", "%#{keyword}%")).
		or(where("grouping LIKE ?", "%#{keyword}%")).
		or(where("average_age LIKE ?", "%#{keyword}%")).
		or(where("LOWER(appeal) LIKE ?", "%#{keyword.downcase}%"))
	end

	# Tag用
  scope :user_order, -> { includes(:prefecture).order("prefectures.sort asc", switch: :asc, last_post: :desc) }
  scope :user_sort, -> { user_hide.user_order }
  scope :grouping, ->(group_name) do
    where("grouping LIKE ?", "%#{group_name}%")
  end
  scope :average_age, ->(age_name) do
    where("average_age LIKE ?", "%#{age_name}%")
  end
	scope :tag_word, ->(tag_keyword) do
		where("name LIKE ?", "%#{tag_keyword}%").
		or(where("schedule LIKE ?", "%#{tag_keyword}%")).
		or(where("area LIKE ?", "%#{tag_keyword}%")).
		or(where("recruitment LIKE ?", "%#{tag_keyword}%")).
		or(where("member LIKE ?", "%#{tag_keyword}%")).
		or(where("cost LIKE ?", "%#{tag_keyword}%")).
		or(where("goal LIKE ?", "%#{tag_keyword}%")).
		or(where("grouping LIKE ?", "%#{tag_keyword}%")).
		or(where("average_age LIKE ?", "%#{tag_keyword}%")).
		or(where("appeal LIKE ?", "%#{tag_keyword}%"))
	end




  def bookmarked_by?(member)
    bookmarks.where(member_id: member).exists?
  end

end
