class Item < ApplicationRecord
  belongs_to :collection

	validates :name, presence: true
	validates :money, presence: true, numericality: true
end
