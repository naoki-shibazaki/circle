class Prefecture < ApplicationRecord
	has_many :users
	has_many :members
	has_many :cities, ->{ order(:id) }
end
