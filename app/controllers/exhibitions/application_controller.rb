class Exhibitions::ApplicationController < ApplicationController

  # Exhibition関連

  private
  def set_search
		@search = User.ransack(params[:q])
    @categories = ExhibitionCategory.find(1)
		@prefectures = Prefecture.all.order(:order => :asc)
  end

end