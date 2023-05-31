class ExhibitionContact < ApplicationRecord

  belongs_to :exhibition
  validates :email, confirmation: true

end
