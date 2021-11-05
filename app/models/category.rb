class Category < ApplicationRecord
	has_many :events, ->{ order(:order) }
end
