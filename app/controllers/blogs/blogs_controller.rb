class Blogs::BlogsController < Blogs::ApplicationController

  before_action :set_search, only: [:index]

	def index
    user_ids = User.users_list.pluck(:id)

    @blogs = Blog.list(user_ids).page(params[:page])

  end




end