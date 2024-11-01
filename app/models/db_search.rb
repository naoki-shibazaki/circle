# == Schema Information
#
# Table name: db_searches
#
#  id         :bigint           not null, primary key
#  keyword    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class DbSearch < ApplicationRecord

  paginates_per 20

end
