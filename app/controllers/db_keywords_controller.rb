class DbKeywordsController < ApplicationController
  before_action :webmaster

  def index
    @db_keywords = DbKeyword.all.order(id: "DESC").page(params[:page])
  end

  def update
    @keyword =  DbKeyword.find(params[:id])
    if @keyword.update(db_keyword_params)
      flash[:notice] = '更新完了！'
      redirect_to db_keywords_path
    else
      flash[:notice] = 'エラー'
      redirect_to db_keywords_path
    end
  end

  def destroy
    @keyword =  DbKeyword.find(params[:id])
    if @keyword.destroy
      flash[:notice] = '削除しました！'
      redirect_to db_keywords_path
    else
      flash[:notice] = 'エラー'
      redirect_to db_keywords_path
    end
	end


  private
	def db_keyword_params
		params.require(:db_keyword).permit(:keyword)
	end

	def webmaster
    if current_admin_user.id == 1

    else
      flash[:notice] = "権限がありません"
      redirect_to users_path
    end

  end
end
