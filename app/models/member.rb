# == Schema Information
#
# Table name: members
#
#  id                     :integer          not null, primary key
#  age                    :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  gender                 :string
#  image_profile          :string
#  nickname               :string
#  profile                :text
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  prefecture_id          :integer
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

  belongs_to :prefecture, optional: true

	mount_uploader :image_profile, ImageUploader




  def remember_me
    true
  end

end
