class Exhibitions::Prefectures::PrefecturesController < Exhibitions::Prefectures::ApplicationController
  before_action :set_search, only: [:show]

	def index
    redirect_to exhibitions_path, status: 301
  end


  def show
		@prefecture = Prefecture.find_by(kana: params[:kana])
    @exhibitions = Exhibition.where(prefecture_id: @prefecture.id).list.page(params[:page])
  end

end