class UsersController < ApplicationController
include ApplicationHelper

before_action :ensure_correct_user, {only: [:mypage, :edit, :update, :edit2, :update2, :update_contact]}
before_action :set_users

helper_method :link_count


  def top

  end

	def index
		# パンくず
		@b1_name = "サークル検索"
    @b1_url = "/users"

    # amp対応
    amp_set
	end

	def search
		# キーワード分割
		keywords = params[:kw].split(/[[:blank:]]+/).select(&:present?)

		# Userモデルオブジェクト作成
		@users = User

		# 検索ワードの数だけand検索を行う
		keywords.each do |keyword|
			@event_ids = Event.where("name LIKE ?", "%#{keyword}%").map { |e| e.id }
			@prefecture_ids = Prefecture.where("name LIKE ?", "%#{keyword}%").map { |p| p.id }

			@city_ids = City.where("name LIKE ?", "%#{keyword}%").map { |c| c.id }
			@city_user_ids = UsersCity.where(city_id: @city_ids).map { |u| u.user_id }

			@users = @users.search_word(keyword).
			or(@users.where(event_id: @event_ids)).
			or(@users.where(prefecture_id: @prefecture_ids)).or(@users.where(prefecture_sub_id: @prefecture_ids)).
			or(@users.where(id: @city_user_ids))

		end

			# @users = @users.user_sort_1.page(params[:page])

		# ソート機能
      if params[:sort] == "1" || params[:sort] == nil
      @users = @users.user_sort_1.page(params[:page])
      elsif params[:sort] == "2"
      @users = @users.user_sort_2.page(params[:page])
      else params[:sort] == "3"
      @users = @users.user_sort_3.page(params[:page])
      end

	end


	def new
    if admin_user_signed_in? #ログイン判定

    if current_admin_user.users.any?
      redirect_to "/users/#{current_admin_user.users.first.id}/mypage"
    else
      @user = User.new
    end

    else
      flash[:notice] = "登録が必要です"
      redirect_to root_path
    end
	end

	def add
    if admin_user_signed_in? #ログイン判定
    @user = User.new
    else
      flash[:notice] = "登録が必要です"
      redirect_to root_path
    end
	end


	def create
		@user = User.new(user_params)
		@user.admin_user_id = current_admin_user.id
		@user.last_post = Time.now.ago(3.days)
		@user.user_time = Time.now

		if @user.save

			# like検索用
			@user.grouping = @user.users_groups.map{|g| g.group.name}
			@user.average_age = @user.users_ages.map{|a| a.age.name}
			@user.save

			if @user.switch == "受付終了"
				@user.last_post = Time.now.ago(60.days)
				@user.save
			end

			if @user.prefecture.id == 50 #全国選択

				@user.prefecture_sub_id = nil #サブエリアはnil
				@user.save

				flash[:notice] = 'プロフィール更新完了！'
				redirect_to user_path(@user)

			else #47都道府県

				if @user.prefecture_id == @user.prefecture_sub_id #エリア重複判断
					@user.prefecture_sub_id = nil #サブエリアはnil
					@user.save
				end

				flash[:notice] = 'これで最後です！'
				redirect_to "/users/#{@user.id}/edit2"
			end

		else
			render "/users/edit"
		end

	end

	def show
		@user = User.find(params[:id])
		@sub_prefecture = Prefecture.find_by(id: @user.prefecture_sub_id)
		@blogs = Blog.where(user_id: @user.id).order(created_at: "DESC")
		@data = AdminUser.find_by(id: @user.admin_user_id)
		@schedules = Schedule.where(user_id: @user.id).where("day > ?", DateTime.yesterday).order(:day => :asc)
		@questions = Question.where(user_id: @user.id).where.not(answer: nil).order(created_at: "DESC")

		@users = User.ng_account.prefecture(@user.prefecture_id).event(@user.event_id).where(switch: "募集中").where.not(id: @user.id).order(:last_post => :desc)

		@user_ages = @user.users_ages.map{|a| a.age}
		@user_groups = @user.users_groups.map{|g| g.group}
		@user_cities = @user.users_cities.map{|c| c.city}

		if admin_user_signed_in?
		else
			impressionist(@user, nil, unique: [:session_hash])
		end

		# レビュー合計値
		@star_sum = @user.reviews.sum{|review| review[:review]}
		# レビュー数
		@star_count = @user.reviews.count
		# レビュー値
		if @star_count == 0 && @star_sum == 0
			@star_review =  0
		else
			@star_review =  (@star_sum / @star_count.to_f)*5
		end

		if @user.id.to_s != params[:id]
        flash[:notice] = "URLが間違っています"
        redirect_to users_path
		end

		if @user.gallery_01.present?
			@count += 1
		end
		if @user.gallery_02.present?
			@count += 1
		end
		if @user.gallery_03.present?
			@count += 1
		end
		if @user.gallery_04.present?
			@count += 1
		end

		if @user.switch.present?
			if @user.prefecture_sub_id.present?
				@b1_name = @user.event.name
				@b1_url = "/#{@user.event.ruby}"
				@b2_name = @user.prefecture.name
				@b2_url = "/#{@user.event.ruby}/#{@user.prefecture.kana}"
				@b3_name = @sub_prefecture.name
				@b3_url = "/#{@user.event.ruby}/#{@sub_prefecture.kana}"
				@b4_name = @user.name
				@b4_url = ""
			else
				@b1_name = @user.event.name
				@b1_url = "/#{@user.event.ruby}"
				@b2_name = @user.prefecture.name
				@b2_url = "/#{@user.event.ruby}/#{@user.prefecture.kana}"
				@b3_name = @user.name
				@b3_url = ""
			end
		end

    # amp対応
    amp_set
	end

	def edit
		@user = User.find(params[:id])

		@user.users_ages.build
		@user.users_groups.build
		@user.users_cities.build
	end

	def edit2
		@user = User.find(params[:id])
		@prefecture = Prefecture.find_by(id: @user.prefecture_id)
		@cities = City.where(prefecture_id: @user.prefecture_id).order(:id => :asc)
		@sub_prefecture = Prefecture.find_by(id: @user.prefecture_sub_id)
		@sub_cities = City.where(prefecture_id: @user.prefecture_sub_id).order(:id => :asc)


		@user.users_cities.build
	end


	def update
		@user = User.find(params[:id])
		@user.user_time = Time.now if current_admin_user.id != 1

		if @user.update(user_params)

			# like検索用
			@user.grouping = @user.users_groups.map{|g| g.group.name}
			@user.average_age = @user.users_ages.map{|a| a.age.name}
			@user.save


			if @user.switch == "受付終了"
				@user.last_post = Time.now.ago(60.days)
				@user.save
			end

			if @user.prefecture.id == 50 #全国選択

				@user.prefecture_sub_id = nil #サブエリアはnil
				@user.save

				flash[:notice] = 'プロフィール更新完了！'
				redirect_to user_path(@user)

			else #47都道府県

				if @user.prefecture_id == @user.prefecture_sub_id #エリア重複判断
					@user.prefecture_sub_id = nil #サブエリアはnil
					@user.save
				end

				flash[:notice] = 'これで最後です！'
				redirect_to "/users/#{@user.id}/edit2"
			end

		else
			render "/users/edit"
		end

	end

	def update2
		@user = User.find(params[:id])

		if @user.update(user_params)

			flash[:notice] = 'プロフィール更新完了！'
			redirect_to user_path(@user)
		else
			render "/users/edit2"
		end
	end

	def update_contact
		@user = User.find(params[:id])

		if @user.update(user_params)
			flash[:notice] = '「お問い合わせのテンプレ」更新完了！'
			redirect_to "/users/#{@user.id}/contact"
		else
			flash[:notice] = 'エラーが発生しました'
		end
	end


	def destroy
		@user = User.find(params[:id])
		@user.destroy

		flash[:notice] = 'サークルを削除しました'
		redirect_to users_path
	end


	def mypage
		@user = User.find(params[:id])

    @questions_current = Question.where(user_id: @user.id)
    @questions_current_nil = Question.where(user_id: @user.id).where(answer: nil)

		# 管理者判定
		if admin_user_signed_in?

			@blogs = Blog.where(user_id: @user.id).order(created_at: "DESC")
			@opinion = @user.opinions.build

      @blogs_imp = 0
			@count = 0

			# ランキング取得
			@users = User.user_sort_2
			@users.map.with_index(1){ |user,i|
				if user.id.to_i == @user.id.to_i
					@ranking = i
				end
			}

			if @admin_user.users.any?
			else
				redirect_to "/user/add"
			end

		else
      flash[:notice] = "URLが管理者専用ページです"
      redirect_to user_path(@user)
    end

    #無効メール
    if InvalidEmail.find_by(email: @user.admin_user.email)
      @invalid = "無効"
    else
      @invalid = "有効"
    end

		# パンくず
		@b1_name = @user.name
		@b1_url = "/users/#{@user.id}"
		@b2_name = "マイページ"
		@b2_url = "/users/#{@user.id}/mypage"
	end


	def login_form
	end

	def login
  end

  def logout
  end

	def update_email
		if admin_user_signed_in?
			@data = AdminUser.find_by(id: current_admin_user.id)
		end
	end


  def line
  end

  def rules
  end

  def privacypolicy
  end

  def faq
  end

  def admin_users
  end


	def prefecture_index
		# パンくず
		@b1_name = "47都道府県ごとのサークル"
		@b1_url = ""
	end

# 種目別ページ
	def event
		@event = Event.find_by(ruby: params[:ruby])
		@prefectures = Prefecture.all.order(:order => :asc).where.not(kana: "nil")

		# ソート機能
    if params[:sort] == "1" || params[:sort] == nil
      @users = User.event(@event.id).user_sort_1.page(params[:page])
    elsif params[:sort] == "2"
      @users = User.event(@event.id).user_sort_2.page(params[:page])
    else params[:sort] == "3"
      @users = User.event(@event.id).user_sort_3.page(params[:page])
    end

		# パンくず
		@b1_name = @event.name
    @b1_url = "/#{@event.ruby}"

    # amp対応
    amp_set
	end

	def prefecture
		@prefecture = Prefecture.find_by(kana: params[:kana])
		@cities = City.where(prefecture_id: @prefecture.id).order(:id => :asc)

		# ソート機能
      if params[:sort] == "1" || params[:sort] == nil
        @users = User.prefecture(@prefecture.id).or(User.prefecture_sub(@prefecture.id)).or(User.prefecture_50).pref.user_sort_1.page(params[:page])
      elsif params[:sort] == "2"
        @users = User.prefecture(@prefecture.id).or(User.prefecture_sub(@prefecture.id)).or(User.prefecture_50).pref.user_sort_2.page(params[:page])
      else params[:sort] == "3"
        @users = User.prefecture(@prefecture.id).or(User.prefecture_sub(@prefecture.id)).or(User.prefecture_50).pref.user_sort_3.page(params[:page])
      end

		# パンくず
		@b1_name = @prefecture.name
    @b1_url = "/prefectures/#{@prefecture.kana}"

    # amp対応
    amp_set
	end

	def prefecture_city
		@city = City.find_by(city_kana: params[:city_kana])
		@prefecture =  Prefecture.find_by(id: @city.prefecture_id)
		@cities = City.where(prefecture_id: @prefecture.id).order(:id => :asc)
		@prefecture_judge = Prefecture.find_by(kana: params[:kana])

		@city_users = @city.users_cities.map{|c| c.user.id}

		# ソート機能
      if params[:sort] == "1" || params[:sort] == nil
        @users = User.city(@city_users).or(User.prefecture_50).pref.user_sort_1.page(params[:page])
      elsif params[:sort] == "2"
        @users = User.city(@city_users).or(User.prefecture_50).pref.user_sort_2.page(params[:page])
      else params[:sort] == "3"
        @users = User.city(@city_users).or(User.prefecture_50).pref.user_sort_3.page(params[:page])
      end

		if @city.prefecture_id.to_i != @prefecture_judge.id.to_i
        flash[:notice] = "URLが間違っています"
        redirect_to users_path
		end

		# パンくず
		@b1_name = @prefecture.name
		@b1_url = "/prefectures/#{@prefecture.kana}"
		@b2_name = @city.name
    @b2_url = "/prefectures/#{@prefecture.kana}/#{@city.city_kana}"

    # amp対応
    amp_set
	end

	def prefecture_city_station
		@station = Station.find(params[:id])
		@city = City.find_by(id: @station.city_id)

		@prefecture =  Prefecture.find_by(id: @city.prefecture_id)
		@cities = City.where(prefecture_id: @prefecture.id).order(:id => :asc)
		@prefecture_judge = Prefecture.find_by(kana: params[:kana])
		@city_judge = City.find_by(city_kana: params[:city_kana])

		@city_users = @city.users_cities.map{|c| c.user.id}

		# ソート機能
      if params[:sort] == "1" || params[:sort] == nil
        @users = User.city(@city_users).or(User.prefecture_50).pref.user_sort_1.page(params[:page])
      elsif params[:sort] == "2"
        @users = User.city(@city_users).or(User.prefecture_50).pref.user_sort_2.page(params[:page])
      else params[:sort] == "3"
        @users = User.city(@city_users).or(User.prefecture_50).pref.user_sort_3.page(params[:page])
      end

		if @city.prefecture_id.to_i != @prefecture_judge.id.to_i || @city.id.to_i != @city_judge.id.to_i
        flash[:notice] = "URLが間違っています"
        redirect_to users_path
		end

		# パンくず
		@b1_name = @prefecture.name
		@b1_url = "/prefectures/#{@prefecture.kana}"
		@b2_name = @city.name
		@b2_url = "/prefectures/#{@prefecture.kana}/#{@city.city_kana}"
		@b3_name = @station.name
    @b3_url = "/prefectures/#{@prefecture.kana}/#{@city.city_kana}/#{@station.id}"

    # amp対応
    amp_set
	end

	def event_prefecture
		@event = Event.find_by(ruby: params[:ruby])
		@prefecture = Prefecture.find_by(kana: params[:kana])
		@cities = City.where(prefecture_id: @prefecture.id).order(:id => :asc)

		# ソート機能
      if params[:sort] == "1" || params[:sort] == nil
        @users = User.prefecture(@prefecture.id).or(User.prefecture_sub(@prefecture.id)).or(User.prefecture_50).event(@event.id).pref.user_sort_1.page(params[:page])
      elsif params[:sort] == "2"
        @users = User.prefecture(@prefecture.id).or(User.prefecture_sub(@prefecture.id)).or(User.prefecture_50).event(@event.id).pref.user_sort_2.page(params[:page])
      else params[:sort] == "3"
        @users = User.prefecture(@prefecture.id).or(User.prefecture_sub(@prefecture.id)).or(User.prefecture_50).event(@event.id).pref.user_sort_3.page(params[:page])
      end

		# パンくず
		@b1_name = @event.name
		@b1_url = "/#{@event.ruby}"
		@b2_name = @prefecture.name
    @b2_url = "/#{@event.ruby}/#{@prefecture.kana}"

    # amp対応
    amp_set
	end

	def event_prefecture_city
		@event = Event.find_by(ruby: params[:ruby])
		@city = City.find_by(city_kana: params[:city_kana])
		@prefecture =  Prefecture.find_by(id: @city.prefecture_id)
		@cities = City.where(prefecture_id: @prefecture.id).order(:id => :asc)
		@prefecture_judge = Prefecture.find_by(kana: params[:kana])

		@city_users = @city.users_cities.map{|c| c.user.id}

		# ソート機能
      if params[:sort] == "1" || params[:sort] == nil
        @users = User.city(@city_users).or(User.prefecture_50).event(@event.id).pref.user_sort_1.page(params[:page])
      elsif params[:sort] == "2"
        @users = User.city(@city_users).or(User.prefecture_50).event(@event.id).pref.user_sort_2.page(params[:page])
      else params[:sort] == "3"
        @users = User.city(@city_users).or(User.prefecture_50).event(@event.id).pref.user_sort_3.page(params[:page])
      end

		if @city.prefecture_id.to_i != @prefecture_judge.id.to_i
      flash[:notice] = "URLが間違っています"
      redirect_to users_path
		end

		# パンくず
		@b1_name = @event.name
		@b1_url = "/#{@event.ruby}"
		@b2_name = @prefecture.name
		@b2_url = "/#{@event.ruby}/#{@prefecture.kana}"
		@b3_name = @city.name
    @b3_url = "/#{@event.ruby}/#{@prefecture.kana}/#{@city.city_kana}"

    # amp対応
    amp_set
	end


	def event_prefecture_city_station
		@event = Event.find_by(ruby: params[:ruby])
		@station = Station.find(params[:id])
		@city = City.find_by(id: @station.city_id)

		@prefecture =  Prefecture.find_by(id: @city.prefecture_id)
		@cities = City.where(prefecture_id: @prefecture.id).order(:id => :asc)
		@prefecture_judge = Prefecture.find_by(kana: params[:kana])
		@city_judge = City.find_by(city_kana: params[:city_kana])

		@city_users = @city.users_cities.map{|c| c.user.id}

		# ソート機能
    if params[:sort] == "1" || params[:sort] == nil
      @users = User.city(@city_users).or(User.prefecture_50).event(@event.id).pref.user_sort_1.page(params[:page])
    elsif params[:sort] == "2"
      @users = User.city(@city_users).or(User.prefecture_50).event(@event.id).pref.user_sort_2.page(params[:page])
    else params[:sort] == "3"
      @users = User.city(@city_users).or(User.prefecture_50).event(@event.id).pref.user_sort_3.page(params[:page])
    end

		if @city.prefecture_id.to_i != @prefecture_judge.id.to_i || @city.id.to_i != @city_judge.id.to_i
      flash[:notice] = "URLが間違っています"
      redirect_to users_path
		end

		# パンくず
		@b1_name = @event.name
		@b1_url = "/#{@event.ruby}"
		@b2_name = @prefecture.name
		@b2_url = "/#{@event.ruby}/#{@prefecture.kana}"
		@b3_name = @city.name
		@b3_url = "/#{@event.ruby}/#{@prefecture.kana}/#{@city.city_kana}"
		@b4_name = @station.name
    @b4_url = "/#{@event.ruby}/#{@prefecture.kana}/#{@city.city_kana}/#{@station.id}"

    # amp対応
    amp_set
	end

	def login
		@b1_name = "ログインページ"
		@b1_url = ""
  end


	def webmaster
    if current_admin_user.id == 1
    else
        flash[:notice] = "権限がありません"
        redirect_to users_path
    end
	end



private
	def set_users
		@search = User.ransack(params[:q])

		# ソート機能
        if params[:sort] == "1" || params[:sort] == nil
			@users = @search.result.user_sort_1.page(params[:page])
        elsif params[:sort] == "2"
			@users = User.user_sort_2.page(params[:page])
        else params[:sort] == "3"
			@users = User.user_sort_3.page(params[:page])
        end


		@user_all = User.all.order(:last_post => :desc).where.not(switch: "").page(params[:page])

		@events = Event.all.where.not(id: 0).order(:order => :asc)
		@prefectures = Prefecture.all.order(:order => :asc).where.not(id: 0)
		@cities = City.all.order(:id => :asc)
		@ages = Age.all
		@groups = Group.all.order(:id => :asc)
		@schedules = Schedule.where("day > ?", DateTime.yesterday).order(:day => :asc)

		@x = "nil"
		@category = "nil"
		@contact_judge = ""

		if admin_user_signed_in?
			@admin_user = current_admin_user
			@user = @admin_user.users.first
		end

	end

	def user_params
		params.require(:user).permit(
			:name, :email, :image_name, :header_image, :line_id, :switch, :item, :prefecture, :area, :schedule, :time_s, :time_e, :venue_address, :note, :age, :recruitment, :foundation, :member, :cost, :web, :appeal, :password, :goal, :user_id, :event_id, :decade, :prefecture_id, :image, :pic_profile, :pic_header, :image_01, :image_02, :gallery_01, :gallery_02, :gallery_03, :gallery_04, :requirement, :impressions_count, :line_count, :mail_count, :user_time, :last_post, :contact, :twitter, :instagram, :txt, :prefecture_sub_id, :opinion, :template, :sent_count, :review_score, :ng_account,
			decade_age:[], average_age:[] ,grouping:[], age_ids:[], group_ids:[], city_ids:[]
    )
	end

	def ensure_correct_user
		if admin_user_signed_in?
			@user = User.find(params[:id])

			if current_admin_user.id == @user.admin_user_id
				# OK
			elsif current_admin_user.id == 1
				#OK
			else
        flash[:notice] = "権限がありません"
        redirect_to users_path
			end

		end
	end



end
