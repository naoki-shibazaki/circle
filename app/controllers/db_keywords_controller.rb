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


  def keyword
    if @keywords = DbKeyword.find_by(keyword: params[:q])

        # Userモデルオブジェクト作成
        @users = User

        # キーワード分割
        @keywords = params[:q].split(/[[:blank:]]+/).select(&:present?)

        # 検索ワードの数だけand検索を行う
        @keywords.each do |keyword|
          @event_ids = Event.where("name LIKE ?", "%#{keyword}%").map { |e| e.id }
          @prefecture_ids = Prefecture.where("name LIKE ?", "%#{keyword}%").map { |p| p.id }

          @city_ids = City.where("name LIKE ?", "%#{keyword}%").map { |c| c.id }
          @city_user_ids = UsersCity.where(city_id: @city_ids).map { |u| u.user_id }
          @tag_ids = Tag.where("name LIKE ?", "%#{keyword}%").map { |t| t.id }
          @tag_user_ids = UserTag.where(tag_id: @tag_ids).map { |u| u.user_id }

          @users = @users.search_word(keyword).
          or(@users.where(event_id: @event_ids)).
          or(@users.where(prefecture_id: @prefecture_ids)).or(@users.where(prefecture_sub_id: @prefecture_ids)).
          or(@users.where(id: @city_user_ids)).
          or(@users.where(id: @tag_user_ids))

        end

        # ソート機能
        if params[:sort] == "1" || params[:sort] == nil
        @users = @users.user_sort_1.page(params[:page])
        elsif params[:sort] == "2"
        @users = @users.user_sort_2.page(params[:page])
        else params[:sort] == "3"
        @users = @users.user_sort_3.page(params[:page])
        end

    else
      flash[:notice] = "URLが間違っています"
      redirect_to users_path
    end

      # パンくず
      @b1_name = "サークル検索"
      @b1_url = "/users"
      @b2_name = "「#{params[:q]}」の検索結果"
      @b2_url = ""
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
