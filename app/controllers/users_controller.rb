class UsersController < ApplicationController

# before_action :authenticate_user, {only: [:edit, :update]}
# before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
before_action :ensure_correct_user, {only: [:edit, :update]}


	def top
		@users = User.all.order(updated_at: "DESC").page(params[:page])
	end

	def index
		@users = User.all.order(updated_at: "DESC").page(params[:page])

	end

	def new
		@user = User.new
	end

	def create
		# @user = User.new(user_params)
		# @user.image_name = "default_user.jpg"
		# if @user.save
		#   session[:user_id] = @user.id
		#   flash[:notice] = "ユーザー登録が完了しました"
		#   redirect_to edit_user_path(@user.id)
		# else
		#   render new_user_path
		# end
	end

	def show
		@user = User.find(params[:id])
		@blogs = @user.blogs.all
	end

	def edit
		@user = User.find_by(id: current_admin_user.id)
		@user_button = "更新する"
	end

	def update
		@user = User.find(params[:id])

		if image = params[:user][:image]
			@user.image_name = "#{@user.id}.jpg"
		    File.binwrite("public/user_images/#{@user.image_name}",image.read)
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
		@user = User.find_by(email: params[:session][:email],
							 password: params[:session][:password])
		if @user
			session[:user_id] = @user.id
			flash[:notice] = "ログインしました"
			redirect_to users_path
		else
			render("users/login_form")
		end
 	end

 	def logout
	    session[:user_id] = nil
	    flash[:notice] = "ログアウトしました"
	    redirect_to users_path
  	end

	def ensure_correct_user
	   if current_admin_user.id != params[:id].to_i
	      flash[:notice] = "権限がありません"
	      redirect_to users_path
	   end
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
		    :average_age, 
		    :cost, 
		    :web, 
		    :appeal, 
		    :password, 
		    :goal,
		    :user_id,
		    :prefecture_id
    	)
	end



end
