class Circles::CirclesController < Circles::ApplicationController
  before_action :set_search, only: [:index, :search]

	def index
    users = User.list
    case params[:sort]
    when "1", nil
      @users = users.sort_1.page(params[:page])
    when "2"
      @users = users.sort_2.page(params[:page])
    when "3"
      @users = users.sort_3.page(params[:page])
    end

  end


  def show
		@user = User.find(params[:id])
		@sub_prefecture = Prefecture.find_by(id: @user.prefecture_sub_id)
		@schedules = Schedule.where(user_id: @user.id).where("day > ?", DateTime.yesterday).order(:day => :asc)
		@questions = Question.where(user_id: @user.id).where.not(answer: nil).order(created_at: "DESC")

    @admin_user = AdminUser.find(@user.admin_user.id)

    @user_cities = @user.users_cities.includes([city: :prefecture]).map{|c| c.city}
    @user_groups = @user.users_groups.includes([:group]).map{|g| g.group}
		@user_ages = @user.users_ages.includes([:age]).map{|a| a.age}

		@users = User.where(ng_account: nil).or(User.where(ng_account: "OK")).where.not(switch: "", appeal: "", id: @user.id).prefecture(@user.prefecture_id).event(@user.event_id).where(switch: "募集中").order(:last_post => :desc).limit(5)
  end



	def search
    # Userモデルオブジェクト作成
		users = User

		# キーワード分割
    keywords = params[:q].split(/[[:blank:]]+/).select(&:present?)

		# 検索ワードの数だけand検索を行う
		keywords.each do |keyword|
			event_ids = Event.where("name LIKE ?", "%#{keyword}%").pluck(:id)
			prefecture_ids = Prefecture.where("name LIKE ?", "%#{keyword}%").pluck(:id)

      city_ids = City.where("name LIKE ?", "%#{keyword}%").pluck(:id)
			city_user_ids = UsersCity.where(city_id: city_ids).pluck(:user_id)

      tag_ids = Tag.where("name LIKE ?", "%#{keyword}%").pluck(:id)
			tag_user_ids = UserTag.where(tag_id: tag_ids).pluck(:user_id)

			users = users.search_word(keyword).
			or(users.where(event_id: event_ids)).
			or(users.where(prefecture_id: prefecture_ids)).or(users.where(prefecture_sub_id: prefecture_ids)).
			or(users.where(id: city_user_ids)).
			or(users.where(id: tag_user_ids))
		end

    users = users.list

    case params[:sort]
    when "1", nil
      @users = users.sort_1.page(params[:page])
    when "2"
      @users = users.sort_2.page(params[:page])
    when "3"
      @users = users.sort_3.page(params[:page])
    end


  # 検索ワードの保存
    # 各キーワードを半角で保存
    keywords.map.with_index(1){|kw,i|
      if i == 1
        @sort_kw = "#{@sort_kw}" + "#{kw}"
      else
        # 2個目以降は間に半角スペース
        @sort_kw = "#{@sort_kw}" + " #{kw}"
      end
    }
    if DbKeyword.find_by(keyword: @sort_kw) || params[:q].count("^ ") <= 1 || @users.count == 0
    else
      @db_keyword = DbKeyword.new
      @db_keyword.keyword = @sort_kw
      @db_keyword.save
    end

    # 既存と同じキーワードの場合カウント+1
    if @kw = DbKeyword.find_by(keyword: @sort_kw)
      @kw.increment!(:search_count, 1)
    end

  end




end