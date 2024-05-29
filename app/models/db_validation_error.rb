# == Schema Information
#
# Table name: db_validation_errors
#
#  id         :integer          not null, primary key
#  content_01 :text
#  content_02 :text
#  content_03 :text
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class DbValidationError < ApplicationRecord

  paginates_per 20

end
