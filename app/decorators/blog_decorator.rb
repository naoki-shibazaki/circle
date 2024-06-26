# frozen_string_literal: true

module BlogDecorator

  def ogp_img
    if image_01.present?
      self.image_01.url
    elsif self.user.pic_profile.present?
      self.user.pic_profile.url
    elsif self.user.pic_header.present?
      self.user.pic_header.url
    else
      image_url('/images/default.png')
    end
  end

end