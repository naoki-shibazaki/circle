# frozen_string_literal: true

module UserDecorator

  def ogp_img
    if pic_profile.present?
      self.pic_profile.url
    elsif pic_header.present?
      self.pic_header.url
    else
      image_url("/images/events/#{self.event.ruby}.jpg")
    end
  end

end