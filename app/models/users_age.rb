# == Schema Information
#
# Table name: users_ages
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  age_id     :integer
#  user_id    :integer
#
class UsersAge < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :age, optional: true

end
