class UsersController < ApplicationController

# before_action :authenticate_user, {only: [:edit, :update]}
# before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
before_action :ensure_correct_user, {only: [:edit, :update, :edit2, :update2]}
before_action :set_users

impressionist unique: [:session_hash]
helper_method :link_count


	def top 
	end

	def index
		# パンくず
		@b1_name = "サークル検索"
		@b1_url = "/users"
	end

	def new
	    if admin_user_signed_in? #ログイン判定

	    	if @user.blank? #未登録

				@user = User.new
				@user.id = current_admin_user.id
				@user.last_post = Time.now.ago(3.days)
				@user.user_time = Time.now
				@user.save

				flash[:notice] = '詳細を教えてください！'
				redirect_to edit_user_path(@user.id)

			else #登録済み
				flash[:notice] = 'ログイン成功！'
				redirect_to edit_user_path(@user.id)
			end

    	else
		    flash[:notice] = "登録が必要です"
		    redirect_to root_path
    	end	
	end

	def create
	end

	def show
		@user = User.find(params[:id])
		@sub_prefecture = Prefecture.find_by(id: @user.prefecture_sub_id)
		@blogs = Blog.where(user_id: @user.id).order(created_at: "DESC")
		@data = AdminUser.find_by(id: params[:id])
		@schedules = Schedule.where(user_id: @user.id).where("day > ?", DateTime.yesterday).order(:day => :asc)
		@users = User.where(event_id: @user.event_id).where(prefecture_id: @user.prefecture_id).where(switch: "募集中").order(:last_post => :desc)

		@user_ages = @user.users_ages.map{|a| a.age}
		@user_groups = @user.users_groups.map{|g| g.group}
		@user_cities = @user.users_cities.map{|c| c.city}

		# 手作業反映用
		if admin_user_signed_in?		
			if current_admin_user.id == 1  		
				@cities = City.where(prefecture_id: @user.prefecture.id).order(:id => :asc)
				@sub_prefecture = Prefecture.find_by(id: @user.prefecture_sub_id)
				@sub_cities = City.where(prefecture_id: @user.prefecture_sub_id)
				@user.users_cities.build
			end
		end
		# 手作業反映用

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

		@mail_title = "【#{@user.name}】お問い合わせ"
		@mail_message = "こちらに相談内容をご記入ください！"

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
		@sub_cities = City.where(prefecture_id: @user.prefecture_sub_id)


		@user.users_cities.build
	end


	def update
		@user = User.find(params[:id])
		@user.user_time = Time.now

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
				redirect_to user_path

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
			redirect_to user_path
		else
			render "/users/edit2"
		end	
	end


	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path		
	end


	def mypage
		@user = User.find(params[:id])
		@blogs = Blog.where(user_id: @user.id).order(created_at: "DESC")

    	impressionist(@user, nil, unique: [:session_hash])
    	@week_imps = User.where(created_at: 7.day.ago.all_day)
    	@blogs_imp = 0
		@count = 0

	   	if current_admin_user.id.to_i == @user.id.to_i	   		
		
	   	elsif current_admin_user.id == 1 

		else
		      flash[:notice] = "権限がありません"
		      redirect_to users_path
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


	def ensure_correct_user
	   if current_admin_user.id != params[:id].to_i
	   		if current_admin_user.id == 1   			
		   	else
		      flash[:notice] = "権限がありません"
		      redirect_to users_path
		    end
	   end
	end

	def webmaster
   		if current_admin_user.id == 1   

   			# @users_cities = UsersCity.all
   			# @city_users = @city.users_cities.map{|c| c.user.id}

	   	else
	      flash[:notice] = "権限がありません"
	      redirect_to users_path
	    end
	end


 	def line
  	end	

  	def link
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

	def event
		@event = Event.find_by(ruby: params[:ruby])
		@prefectures = Prefecture.all.order(:order => :asc).where.not(kana: "nil")
		@users = User.event(@event.id).user_sort.page(params[:page])

		# パンくず		
		@b1_name = @event.name
		@b1_url = "/#{@event.ruby}"
	end

	def prefecture
		@prefecture = Prefecture.find_by(kana: params[:kana])
		@cities = City.where(prefecture_id: @prefecture.id).order(:id => :asc)
		@users = User.prefecture(@prefecture.id).or(User.prefecture_sub(@prefecture.id)).or(User.prefecture_50).user_sort.page(params[:page])
		
		# パンくず
		@b1_name = @prefecture.name
		@b1_url = "/prefectures/#{@prefecture.kana}"	
	end

	def prefecture_city
		@city = City.find_by(city_kana: params[:city_kana])	
		@prefecture =  Prefecture.find_by(id: @city.prefecture_id)
		@cities = City.where(prefecture_id: @prefecture.id).order(:id => :asc)
		@prefecture_judge = Prefecture.find_by(kana: params[:kana])

		@city_users = @city.users_cities.map{|c| c.user.id}
		# @users = User.city(@city_users).or(User.prefecture_50).user_sort.page(params[:page])
		@users = User.city(@city_users).user_sort.page(params[:page])		

		if @city.prefecture_id.to_i != @prefecture_judge.id.to_i
		      flash[:notice] = "URLが間違っています"
		      redirect_to users_path		
		end

		# パンくず
		@b1_name = @prefecture.name
		@b1_url = "/prefectures/#{@prefecture.kana}"	
		@b2_name = @city.name
		@b2_url = "/prefectures/#{@prefecture.kana}/#{@city.city_kana}"			
	end

	def event_prefecture
		@event = Event.find_by(ruby: params[:ruby])
		@prefecture = Prefecture.find_by(kana: params[:kana])
		@users = User.prefecture(@prefecture.id).or(User.prefecture_sub(@prefecture.id)).or(User.prefecture_50).event(@event.id).user_sort.page(params[:page])

		# パンくず
		@b1_name = @event.name
		@b1_url = "/#{@event.ruby}"
		@b2_name = @prefecture.name
		@b2_url = "/#{@event.ruby}/#{@prefecture.kana}"	
	end

	def event_prefecture_city
		@event = Event.find_by(ruby: params[:ruby])
		@city = City.find_by(city_kana: params[:city_kana])	
		@prefecture =  Prefecture.find_by(id: @city.prefecture_id)
		@prefecture_judge = Prefecture.find_by(kana: params[:kana])

		@city_users = @city.users_cities.map{|c| c.user.id}
		@users = User.city(@city_users).or(User.prefecture_50).event(@event.id).user_sort.page(params[:page])

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
	end



	def contact

		if params[:count] == "line_b" || params[:count] == "mail_b"
		@blog = Blog.find(params[:id])
		@user = User.find_by(id: @blog.user.id)
		@data = AdminUser.find_by(id: @blog.user.id)

			if params[:count] == "line_b"
				@user.line_count += 1
				@user.save

		  	elsif params[:count] == "mail_b"
				@user.mail_count += 1
				@user.save
				
		  	else
		  		
		  	end

		elsif params[:count] == "line_s" || params[:count] == "mail_s"
		@schedule = Schedule.find(params[:id])
		@user = User.find_by(id: @schedule.user_id)	
		@data = AdminUser.find_by(id: @schedule.user_id)

			if params[:count] == "line_s"
				@user.line_count += 1
				@user.save

		  	elsif params[:count] == "mail_s"
				@user.mail_count += 1
				@user.save

		  	else
		  		
		  	end			
			
		else
		@user = User.find(params[:id])
		@data = AdminUser.find_by(id: params[:id])

			if params[:count] == "line"
				@user.line_count += 1
				@user.save

		  	elsif params[:count] == "mail"
				@user.mail_count += 1
				@user.save
				
		  	else
		  		
		  	end

		end

		@mail_title = "【#{@user.name}】お問い合わせ"
		@mail_message = "こちらにご記入ください！"

	end


	def set_users
		@search = User.ransack(params[:q]) 
		@users = @search.result.order(:last_post => :desc).where.not(switch: "").page(params[:page])	
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
			@user = User.find_by(id: current_admin_user.id)
		end

	end

private
	def user_params
		params.require(:user).permit(
			:name, :email, :image_name, :header_image, :line_id, :switch, :item, :prefecture, :area, :schedule, :time_s, :time_e, :venue_address, :note, :age, :recruitment, :foundation, :member, :cost, :web, :appeal, :password, :goal, :user_id, :event_id, :decade, :prefecture_id, :image, :pic_profile, :pic_header, :image_01, :image_02, :gallery_01, :gallery_02, :gallery_03, :gallery_04, :requirement, :impressions_count, :line_count, :mail_count, :user_time, :last_post, :contact, :twitter, :instagram, :txt, :prefecture_sub_id,
			decade_age:[], average_age:[] ,grouping:[], age_ids:[], group_ids:[], city_ids:[]
   		)
	end


end
