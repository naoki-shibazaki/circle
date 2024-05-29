# == Schema Information
#
# Table name: users_cities
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  city_id    :integer
#  user_id    :integer
#
class UsersCity < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :city, optional: true

end
