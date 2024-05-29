# == Schema Information
#
# Table name: items
#
#  id            :integer          not null, primary key
#  check         :string
#  money         :integer
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  collection_id :integer
#
# Indexes
#
#  index_items_on_collection_id  (collection_id)
#
# Foreign Keys
#
#  collection_id  (collection_id => collections.id)
#
class Item < ApplicationRecord
  belongs_to :collection

	validates :name, presence: true
	validates :money, presence: true, numericality: true
end
