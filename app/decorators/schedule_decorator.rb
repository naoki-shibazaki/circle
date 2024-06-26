# frozen_string_literal: true

module ScheduleDecorator

  def ogp_img
    if top_image.present?
      self.top_image.url
    else
      image_url("/images/schedule_ogp.jpg")
    end
  end

end