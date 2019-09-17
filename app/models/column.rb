class Column < ApplicationRecord
 ALLOWED_PARAMS = [:id, :title, :text]

 validates :title, presence: true
 validates :text, presence: true


mount_uploader :image, ImageUploader


end
