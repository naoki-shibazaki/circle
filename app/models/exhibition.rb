# == Schema Information
#
# Table name: exhibitions
#
#  id                   :integer          not null, primary key
#  detail               :text
#  end_date             :datetime
#  event_date           :datetime
#  exhibit_person_price :integer
#  gallery_img_01       :string
#  gallery_img_02       :string
#  gallery_img_03       :string
#  gallery_img_04       :string
#  header_img           :string
#  name                 :string           not null
#  online               :integer          default(1)
#  show_contact         :integer          default(1)
#  venue_address        :string
#  venue_name           :string
#  visitor_price        :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  exhibition_group_id  :integer          not null
#  prefecture_id        :integer          not null
#
# Indexes
#
#  index_exhibitions_on_exhibition_group_id  (exhibition_group_id)
#  index_exhibitions_on_prefecture_id        (prefecture_id)
#
# Foreign Keys
#
#  exhibition_group_id  (exhibition_group_id => exhibition_groups.id)
#  prefecture_id        (prefecture_id => prefectures.id)
#
class Exhibition < ApplicationRecord

  belongs_to :prefecture
  belongs_to :exhibition_group

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

	paginates_per 10

  def exhibitor
    self.exhibition_group.exhibition_group_profile
  end

  scope :list, -> {includes([:prefecture, exhibition_group: :exhibition_group_profile]).order(end_date: "desc")}


end
