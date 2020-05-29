class Age < ApplicationRecord
	# has_many :users
	has_many :users_ages
  	has_many :users, through: :users_ages

end
