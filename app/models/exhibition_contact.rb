# == Schema Information
#
# Table name: exhibition_contacts
#
#  id            :integer          not null, primary key
#  content       :text             not null
#  email         :string           not null
#  name          :string           not null
#  subject       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  exhibition_id :integer          not null
#
# Indexes
#
#  index_exhibition_contacts_on_exhibition_id  (exhibition_id)
#
# Foreign Keys
#
#  exhibition_id  (exhibition_id => exhibitions.id)
#
class ExhibitionContact < ApplicationRecord

  belongs_to :exhibition
  validates :email, confirmation: true

end
