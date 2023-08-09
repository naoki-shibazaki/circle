# == Schema Information
#
# Table name: invalid_emails
#
#  id         :integer          not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class InvalidEmail < ApplicationRecord

  validates :email, uniqueness: true

end
