# == Schema Information
#
# Table name: admin_users
#
#  id                     :integer          not null, primary key
#  age                    :string
#  check                  :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  gender                 :string
#  image_profile          :string
#  nickname               :string
#  open                   :integer          default(0), not null
#  profile                :text
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  prefecture_id          :integer
#
# Indexes
#
#  index_admin_users_on_email                 (email) UNIQUE
#  index_admin_users_on_prefecture_id         (prefecture_id)
#  index_admin_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class AdminUser < ApplicationRecord

  has_many :users, dependent: :destroy
  belongs_to :prefecture, optional: true

  # accepts_nested_attributes_for :user

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

    validates :nickname, length: { maximum: 16 }

    mount_uploader :image_profile, ImageUploader

  def remember_me
    true
  end

  scope :ng_account, -> {where(check: nil)}


end
