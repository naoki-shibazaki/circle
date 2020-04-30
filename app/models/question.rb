class Question < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { in: 1..80 }

  paginates_per 20
end
