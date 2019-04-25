class Blog < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :user_id, presence: true
	
	has_attached_file :photo,
	  styles: { medium: "300x300>", thumb: "100x100>" },
	  path: "#{Rails.root}/app/assets/images/:filename"
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/


end
