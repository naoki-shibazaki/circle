class UsersController < ApplicationController

# before_action :authenticate_user, {only: [:edit, :update]}
# before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
before_action :ensure_correct_user, {only: [:edit, :update]}
before_action :set_users

	def top
		@users = User.all.order(updated_at: "DESC").where.not(switch: "nil").page(params[:page]).per(10)
	end

	def index
		@users = User.all.order(updated_at: "DESC").where.not(switch: "nil").page(params[:page]).per(10)
	end

	def new
		@user = User.new
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
		@average = [10,20,30]
	end

	def update
		@user = User.find(params[:id])

		if image = params[:user][:image]
			@user.image_name = "#{@user.id}.jpg"
		    File.binwrite("public/user_images/#{@user.image_name}",image.read)

			# img = MiniMagick::Image.read(params[:user][:image])
		 #    img.resize "300x300"
		 #    img.write "public/user_images/#{@user.image_name}"

		end

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

	def event_index
		@events = Event.all
		@prefectures = Prefecture.all
		@users = User.all.order(updated_at: "DESC").where.not(switch: "nil").page(params[:page]).per(10)	
	end

	def prefecture_index
		@events = Event.all
		@prefectures = Prefecture.all
		@users = User.all.order(updated_at: "DESC").where.not(switch: "nil").page(params[:page]).per(10)	
	end

	def event
		@event = Event.find_by(ruby: params[:ruby])
		@prefectures = Prefecture.all.where.not(kana: "nil")
		@x = "nil"
		@users = User.where(event_id: @event.id).order(updated_at: "DESC").page(params[:page]).per(10)
	end

	def prefecture
		@prefecture = Prefecture.find_by(kana: params[:kana])
		@users = User.where(prefecture_id: @prefecture.id).order(updated_at: "DESC").page(params[:page]).per(10)
	end

	def event_prefecture
		@event = Event.find_by(ruby: params[:ruby])
		@prefecture = Prefecture.find_by(kana: params[:kana])
		@users = User.where(event_id: @event.id, prefecture_id: @prefecture.id).order(updated_at: "DESC").page(params[:page]).per(10)
	end


private
	def user_params
		params.require(:user).permit(
			:name, 
			:email,	
			:image_name, 
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
		    :average_age => []

    	)
	end

	def set_users
		@users = User.where.not(switch: "nil")
	end

		


end
