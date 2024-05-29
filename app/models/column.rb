# == Schema Information
#
# Table name: columns
#
#  id          :integer          not null, primary key
#  description :text
#  image       :string
#  text        :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Column < ApplicationRecord
 ALLOWED_PARAMS = [:id, :title, :text]

 validates :title, presence: true
 validates :text, presence: true


mount_uploader :image, ImageUploader


end
