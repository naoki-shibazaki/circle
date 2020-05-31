class UsersCity < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :city, optional: true

end
