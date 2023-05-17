class Exhibition < ApplicationRecord

  belongs_to :prefecture

  has_many :exhibition_contacts, dependent: :destroy

end
