class Exhibitions::Categories::CategoriesController < Exhibitions::Categories::ApplicationController
  before_action :set_search, only: [:show]

	def index
    redirect_to exhibitions_path, status: 301
  end


  def show
    @category = ExhibitionCategory.find_by(kana: params[:kana])
    @exhibitions = Exhibition.list.page(params[:page])
  end



end