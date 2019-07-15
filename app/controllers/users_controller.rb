class UsersController < ApplicationController

# before_action :authenticate_user, {only: [:edit, :update]}
# before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
before_action :ensure_correct_user, {only: [:edit, :update]}
before_action :set_users

	def top
		@users = User.all.order(:last_post => :desc).where.not(switch: "nil").page(params[:page])
	end

	def index
		@users = User.all.order(:last_post => :desc).where.not(switch: "nil").page(params[:page])

		# パンくず
		@b1_name = "サークル一覧"
		@b1_url = "/users"
	end

	def new
	end

	def create
	end

	def show
		@user = User.find(params[:id])
		@blogs = Blog.where(user_id: @user.id).order(created_at: "DESC")
		@data = AdminUser.find_by(id: params[:id])


		if @user.switch.present?
		@b1_name = @user.event.name
		@b1_url = "/#{@user.event.ruby}"
		@b2_name = @user.prefecture.name
		@b2_url = "/#{@user.event.ruby}/#{@user.prefecture.kana}"	
		@b3_name = @user.name.truncate(8)
		@b3_url = ""
		end



	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update(user_params)
			flash[:share] = 'プロフィール更新完了！'
			redirect_to user_path
		else
			render "/users/edit"
		end	
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path		
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

			
			# @data.skip_reconfirmation! 
			# if @data.update_with_password(user_params)
			#   redirect_to user_path(@data), notice: 'アドレスを更新しました'
			# else
			#   render path
			# end
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


	def prefecture_index
		@users = User.all.order(:last_post => :desc).where.not(switch: "nil").page(params[:page])	
	end

	def event
		@event = Event.find_by(ruby: params[:ruby])
		@prefectures = Prefecture.all.where.not(kana: "nil")
		@users = User.where(event_id: @event.id).order(:last_post => :desc).where.not(switch: "nil").page(params[:page])
		if @users.count == 0
			@users = User.all.order(:last_post => :desc).where.not(switch: "nil").page(params[:page])
			@hit = 0 
		end

		# パンくず		
		@b1_name = @event.name
		@b1_url = "/#{@event.ruby}"
	end

	def prefecture
		@prefecture = Prefecture.find_by(kana: params[:kana])
		@users = User.where(prefecture_id: @prefecture.id).order(:last_post => :desc).where.not(switch: "nil").page(params[:page])
		if @users.count == 0
			@users = User.all.order(:last_post => :desc).where.not(switch: "nil").page(params[:page])
			@hit = 0 
		end

		# パンくず
		@b1_name = @prefecture.name
		@b1_url = "/prefectures/#{@prefecture.kana}"	
	end


	def prefecture_group
		@group = Group.find_by(group: params[:group])
		@prefecture = Prefecture.find_by(kana: params[:kana])
		@users = User.where(prefecture_id: @prefecture.id).where('grouping like?', "%#{@group.name}%").order(:last_post => :desc).where.not(switch: "nil").page(params[:page])
		if @users.count == 0
			@users = User.all.order(:last_post => :desc).where.not(switch: "nil").page(params[:page])
			@hit = 0 
		end	

		# パンくず
		@b1_name = @prefecture.name
		@b1_url = "/prefectures/#{@prefecture.kana}"	
		@b2_name = @group.name
		@b2_url = "/prefectures/#{@prefecture.kana}/#{@group.group}"
	end


	def prefecture_age
		@age = Age.find_by(decade: params[:decade])
		@group = Group.find_by(group: params[:group])
		@prefecture = Prefecture.find_by(kana: params[:kana])
		@users = User.where(prefecture_id: @prefecture.id).where('average_age like?', "%#{@age.name}%").where('grouping like?', "%#{@group.name}%").order(:last_post => :desc).where.not(switch: "nil").page(params[:page])
		if @users.count == 0
			@users = User.all.order(:last_post => :desc).where.not(switch: "nil").page(params[:page])
			@hit = 0 
		end	

		# パンくず
		@b1_name = @prefecture.name
		@b1_url = "/prefectures/#{@prefecture.kana}"	
		@b2_name = @group.name
		@b2_url = "/prefectures/#{@prefecture.kana}/#{@group.group}"	
		@b3_name = @age.name
		@b3_url = "/prefectures/#{@prefecture.kana}/#{@group.group}/#{@age.decade}"		
	end





	def event_prefecture
		@event = Event.find_by(ruby: params[:ruby])
		@prefecture = Prefecture.find_by(kana: params[:kana])
		@users = User.where(event_id: @event.id, prefecture_id: @prefecture.id).order(:last_post => :desc).where.not(switch: "nil").page(params[:page])
		if @users.count == 0
			@users = User.all.order(:last_post => :desc).where.not(switch: "nil").page(params[:page])
			@hit = 0 
		end

		# パンくず
		@b1_name = @event.name
		@b1_url = "/#{@event.ruby}"
		@b2_name = @prefecture.name
		@b2_url = "/#{@event.ruby}/#{@prefecture.kana}"	
	end

	def age
		@age = Age.find_by(decade: params[:decade])
		@event = Event.find_by(ruby: params[:ruby])
		@prefecture = Prefecture.find_by(kana: params[:kana])
		@users = User.where(event_id: @event.id, prefecture_id: @prefecture.id).where('average_age like?', "%#{@age.name}%").order(:last_post => :desc).where.not(switch: "nil").page(params[:page])
		if @users.count == 0
			@users = User.all.order(:last_post => :desc).where.not(switch: "nil").page(params[:page])
			@hit = 0 
		end	

		# パンくず
		@b1_name = @event.name
		@b1_url = "/#{@event.ruby}"
		@b2_name = @prefecture.name
		@b2_url = "/#{@event.ruby}/#{@prefecture.kana}"	
		@b3_name = @age.name
		@b3_url = "/#{@event.ruby}/#{@prefecture.kana}/#{@age.decade}"	
	end





	# def group
	# 	@group = Group.find_by(group: params[:group])
	# 	@event = Event.find_by(ruby: params[:ruby])
	# 	@prefecture = Prefecture.find_by(kana: params[:kana])
	# 	@users = User.where(event_id: @event.id, prefecture_id: @prefecture.id).where('grouping like?', "%#{@group.name}%").order(:last_post => :desc).where.not(switch: "nil").page(params[:page])
	# 	if @users.count == 0
	# 		@users = User.all.order(:last_post => :desc).where.not(switch: "nil").page(params[:page])
	# 		@hit = 0 
	# 	end	

	# 	# パンくず
	# 	@b1_name = @event.name
	# 	@b1_url = "/#{@event.ruby}"
	# 	@b2_name = @prefecture.name
	# 	@b2_url = "/#{@event.ruby}/#{@prefecture.kana}"	
	# 	@b3_name = @group.name
	# 	@b3_url = "/#{@event.ruby}/#{@prefecture.kana}/#{@group.group}"	
	# end


	def group_beginner
		@group = Group.find_by(:group => "beginner")
		@event = Event.find_by(ruby: params[:ruby])
		@prefecture = Prefecture.find_by(kana: params[:kana])
		@users = User.where(event_id: @event.id, prefecture_id: @prefecture.id).where('grouping like?', "%#{@group.name}%").order(:last_post => :desc).where.not(switch: "nil").page(params[:page])
		if @users.count == 0
			@users = User.all.order(:last_post => :desc).where.not(switch: "nil").page(params[:page])
			@hit = 0 
		end	

		# パンくず
		@b1_name = @event.name
		@b1_url = "/#{@event.ruby}"
		@b2_name = @prefecture.name
		@b2_url = "/#{@event.ruby}/#{@prefecture.kana}"	
		@b3_name = @group.name
		@b3_url = "/#{@event.ruby}/#{@prefecture.kana}/#{@group.group}"	

	end

	def group_expert
		@group = Group.find_by(:group => "expert")
		@event = Event.find_by(ruby: params[:ruby])
		@prefecture = Prefecture.find_by(kana: params[:kana])
		@users = User.where(event_id: @event.id, prefecture_id: @prefecture.id).where('grouping like?', "%#{@group.name}%").order(:last_post => :desc).where.not(switch: "nil").page(params[:page])
		if @users.count == 0
			@users = User.all.order(:last_post => :desc).where.not(switch: "nil").page(params[:page])
			@hit = 0 
		end	

		# パンくず
		@b1_name = @event.name
		@b1_url = "/#{@event.ruby}"
		@b2_name = @prefecture.name
		@b2_url = "/#{@event.ruby}/#{@prefecture.kana}"	
		@b3_name = @group.name
		@b3_url = "/#{@event.ruby}/#{@prefecture.kana}/#{@group.group}"	

	end

	def group_student
		@group = Group.find_by(:group => "student")
		@event = Event.find_by(ruby: params[:ruby])
		@prefecture = Prefecture.find_by(kana: params[:kana])
		@users = User.where(event_id: @event.id, prefecture_id: @prefecture.id).where('grouping like?', "%#{@group.name}%").order(:last_post => :desc).where.not(switch: "nil").page(params[:page])
		if @users.count == 0
			@users = User.all.order(:last_post => :desc).where.not(switch: "nil").page(params[:page])
			@hit = 0 
		end	

		# パンくず
		@b1_name = @event.name
		@b1_url = "/#{@event.ruby}"
		@b2_name = @prefecture.name
		@b2_url = "/#{@event.ruby}/#{@prefecture.kana}"	
		@b3_name = @group.name
		@b3_url = "/#{@event.ruby}/#{@prefecture.kana}/#{@group.group}"	

	end


	def group_worker
		@group = Group.find_by(:group => "worker")
		@event = Event.find_by(ruby: params[:ruby])
		@prefecture = Prefecture.find_by(kana: params[:kana])
		@users = User.where(event_id: @event.id, prefecture_id: @prefecture.id).where('grouping like?', "%#{@group.name}%").order(:last_post => :desc).where.not(switch: "nil").page(params[:page])
		if @users.count == 0
			@users = User.all.order(:last_post => :desc).where.not(switch: "nil").page(params[:page])
			@hit = 0 
		end	

		# パンくず
		@b1_name = @event.name
		@b1_url = "/#{@event.ruby}"
		@b2_name = @prefecture.name
		@b2_url = "/#{@event.ruby}/#{@prefecture.kana}"	
		@b3_name = @group.name
		@b3_url = "/#{@event.ruby}/#{@prefecture.kana}/#{@group.group}"	

	end





private
	def user_params
		params.require(:user).permit(
			:name, 
			:email,	
			:image_name, 
		    :header_image,
		    :line_id, 
		    :switch, 
		    :item, 
		    :prefecture, 
		    :area, 
		    :schedule, 
		    :age, 
		    :recruitment, 
		    :foundation, 
		    :member, 
		    :cost, 
		    :web, 
		    :appeal, 
		    :password, 
		    :goal,
		    :user_id,
		    :event_id,
		    :decade,
		    :prefecture_id,
		    :image,
		    :pic_profile,
		   	:pic_header,
		    :image_01,
		    :image_02,
		    decade_age: [],
		    average_age: [],
		    grouping: []

    	)
	end

	def set_users
		@users = User.order(:last_post => :desc).where.not(switch: "nil")
		@events = Event.all.where.not(id: 0).order(:order => :asc)
		@prefectures = Prefecture.all.where.not(id: 0)
		@ages = Age.all
		@groups = Group.all.order(:id => :asc)
		@x = "nil"

		if admin_user_signed_in?
			@user = User.find_by(id: current_admin_user.id)
		end

	end

		


end
