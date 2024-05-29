# == Schema Information
#
# Table name: exhibition_groups
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_exhibition_groups_on_email                 (email) UNIQUE
#  index_exhibition_groups_on_reset_password_token  (reset_password_token) UNIQUE
#
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
