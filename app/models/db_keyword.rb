# == Schema Information
#
# Table name: db_keywords
#
#  id           :integer          not null, primary key
#  keyword      :string
#  search_count :integer          default(0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class DbKeyword < ApplicationRecord
end
