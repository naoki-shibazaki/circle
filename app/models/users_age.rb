class UsersAge < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :age, optional: true

end
