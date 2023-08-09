# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  blog_id    :integer
#  user_id    :integer
#
class Like < ApplicationRecord

  # validates :user_id, {presence: true}
  # validates :blog_id, {presence: true}

end
