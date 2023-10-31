class Circles::ApplicationController < ApplicationController

  # サークル関連

  private
  def set_search
    @categories = Category.includes(:events).order(id: :asc)
		@prefectures = Prefecture.all.order(order: :asc)
  end

end