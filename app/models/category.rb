class Category < ApplicationRecord
	has_many :events, ->{ order(:id) }
end
