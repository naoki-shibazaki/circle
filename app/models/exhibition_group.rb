class ExhibitionGroup < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_one :exhibition_group_profile, dependent: :destroy

  has_many :exhibitions, dependent: :destroy

  def remember_me
    true
  end

  def prepare_profile
    exhibition_group_profile || build_exhibition_group_profile
  end

  def profile
    self.exhibition_group_profile
  end

  def has_exhibitor?(exhibitor)
    exhibitor == self.profile
  end

  def has_written?(exhibition)
    exhibitions.exists?(id: exhibition)
  end

end
