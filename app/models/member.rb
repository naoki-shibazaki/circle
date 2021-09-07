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
  has_many :attendances, dependent: :destroy

  belongs_to :prefecture, optional: true

	mount_uploader :image_profile, ImageUploader




  def remember_me
    true
  end

end
