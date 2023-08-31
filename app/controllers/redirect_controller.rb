class RedirectController < ApplicationController

  def blogs_event
    redirect_to blogs_event_path(params[:kana]), status: 301
  end

  def blogs_event_prefecture
    redirect_to blogs_event_prefecture_path(params[:event_kana], params[:kana]), status: 301
  end

end
