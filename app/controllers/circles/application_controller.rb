class Circles::ApplicationController < ApplicationController

  # サークル関連

  private
  def set_search
		@search = User.ransack(params[:q])
    @categories = Category.includes(:events).order(:id => :asc)
		@prefectures = Prefecture.all.order(:order => :asc)
  end

end