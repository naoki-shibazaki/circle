class Blogs::Prefectures::PrefecturesController < Blogs::Prefectures::ApplicationController
  before_action :set_search, only: [:show]

	def index
    redirect_to blogs_path, status: 301
  end


  def show
		@prefecture = Prefecture.find_by(kana: params[:kana])

    user_ids = User.where_pref(@prefecture.id).users_list.pluck(:id)
    @blogs = Blog.list(user_ids).page(params[:page])


  end

end