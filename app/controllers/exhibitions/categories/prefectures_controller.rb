class Exhibitions::Categories::PrefecturesController < Exhibitions::Categories::ApplicationController
  before_action :set_search, only: [:show]

	def index
    redirect_to exhibitions_category_path(params[:event_kana]), status: 301
  end

  def show
    @category = ExhibitionCategory.find_by(kana: params[:category_kana])
    @prefecture = Prefecture.find_by(kana: params[:kana])
    @exhibitions = Exhibition.where(prefecture_id: @prefecture.id).list.page(params[:page])
  end


end