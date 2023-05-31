class Prefecture < ApplicationRecord
	has_many :users
	has_many :members
	has_many :admin_users
  has_many :places
  has_many :exhibitions
  has_many :cities, ->{ order(:id) }
end
