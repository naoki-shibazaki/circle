class AddAttachmentPhotoToBlogs < ActiveRecord::Migration[5.1]
  def self.up
    change_table :blogs do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :blogs, :photo
  end
end
