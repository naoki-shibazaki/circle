# == Schema Information
#
# Table name: users_groups
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer
#  user_id    :integer
#
class UsersGroup < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :group, optional: true

end
