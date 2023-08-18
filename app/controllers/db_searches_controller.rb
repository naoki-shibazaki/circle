class DbSearchesController < ApplicationController
  before_action :webmaster

  def index
    @db_searches = DbSearch.all.order(id: "DESC").page(params[:page])
  end

  private
	def webmaster
    if current_admin_user.id == 1

    else
      flash[:notice] = "権限がありません"
      redirect_to circles_path
    end

  end

end
