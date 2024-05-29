# == Schema Information
#
# Table name: blogs
#
#  id                 :integer          not null, primary key
#  blog_image_name    :string
#  content            :text
#  image_01           :string
#  image_02           :string
#  image_03           :string
#  image_04           :string
#  impressions_count  :integer          default(0)
#  photo              :string
#  photo_content_type :string
#  photo_file_name    :string
#  photo_file_size    :string
#  photo_updated_at   :string
#  title              :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#
# Indexes
#
#  index_blogs_on_user_id  (user_id)
#
class Blog < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :content, length: { minimum: 100}
  validates :user_id, presence: true

	mount_uploader :image_01, ImageUploader
	mount_uploader :image_02, ImageUploader
	mount_uploader :image_03, ImageUploader
	mount_uploader :image_04, ImageUploader

	paginates_per 10

  scope :blog_sort, -> { order(created_at: "DESC") }
  scope :list, -> (user_ids){where(user_id: user_ids).includes(user: [:event, :prefecture]).blog_sort}


end
