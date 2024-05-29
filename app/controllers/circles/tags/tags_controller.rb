class Circles::Tags::TagsController < Circles::Tags::ApplicationController
  before_action :set_search, only: [:show]

	def index
    redirect_to circles_path, status: 301
  end


  def show
		@tag = Tag.find(params[:id])

    users = User.where(id: @tag.users.ids).list
    case params[:sort]
    when "1", nil
      @users = users.sort_1.page(params[:page])
    when "2"
      @users = users.sort_2.page(params[:page])
    when "3"
      @users = users.sort_3.page(params[:page])
    end

  end



end