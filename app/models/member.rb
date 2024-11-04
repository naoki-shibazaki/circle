# == Schema Information
#
# Table name: members
#
#  id                     :bigint           not null, primary key
#  age                    :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  gender                 :string
#  image_profile          :string
#  last_get_point_at      :datetime
#  nickname               :string
#  points                 :integer          default(0), not null
#  profile                :text
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  prefecture_id          :bigint
#  random_id              :string
#
# Indexes
#
#  index_members_on_email                 (email) UNIQUE
#  index_members_on_prefecture_id         (prefecture_id)
#  index_members_on_reset_password_token  (reset_password_token) UNIQUE
#
class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

	# has_many :event_answers
	has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :members_events, dependent: :destroy
  has_many :events, through: :members_events
  has_many :applications

  belongs_to :prefecture, optional: true

  mount_uploader :image_profile, ImageUploader

  def remember_me
    true
  end

  def can_apply?
    last_application = applications.order(applied_at: :desc).first
    return true if last_application.nil?
    last_application.applied_at < 1.month.ago
  end

end
