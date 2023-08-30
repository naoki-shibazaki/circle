class Blogs::BlogsController < Blogs::ApplicationController
  before_action :set_search, only: [:index]

	def index
    user_ids = User.user_ids

    @blogs = Blog.list(user_ids).page(params[:page])

  end




end