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

end
