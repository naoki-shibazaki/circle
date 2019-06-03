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
		@blogs = @user.blogs.all
		@data = AdminUser.find_by(id: params[:id])
	end

	def edit
		@user = User.find_by(id: current_admin_user.id)
	end

	def update
		@user = User.find(params[:id])

		@user.last_post = @user.created_at

		if @user.update(user_params)
			redirect_to users_path
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

	def ensure_correct_user
	   if current_admin_user.id != params[:id].to_i
	      flash[:notice] = "権限がありません"
	      redirect_to users_path
	   end
	end

 	def line
  	end	

	def event_index
		@users = User.all.order(:last_post => :desc).where.not(switch: "nil").page(params[:page])	
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
		@b1_url = "/events/#{@event.ruby}"
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
		@b1_url = "/events/#{@event.ruby}"
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
		@b1_url = "/events/#{@event.ruby}"
		@b2_name = @prefecture.name
		@b2_url = "/#{@event.ruby}/#{@prefecture.kana}"	
		@b3_name = @age.name
		@b3_url = "/#{@event.ruby}/#{@prefecture.kana}/#{@age.decade}"	
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
		    average_age: []

    	)
	end

	def set_users
		@users = User.order(:last_post => :desc).where.not(switch: "nil")
		@events = Event.all.where.not(id: 0).order(:order => :asc)
		@prefectures = Prefecture.all.where.not(id: 0)
		@ages = Age.all
		@x = "nil"
	end

		


end
