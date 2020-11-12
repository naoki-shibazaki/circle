class LinksController < ApplicationController


# before_action :ensure_correct_user, {only: [:edit, :update]}
# before_action :set_links


	def index

	end	

	def new
		@user = User.find(params[:user_id])

		if admin_user_signed_in?
			if @user.link.present?
				@link = @user.link
				redirect_to link_path(@link)
			else
				@link = Link.new				
			end

	    else
		  flash[:notice] = "ログインをしてください"
	      redirect_to "/admin_users/sign_in"
		end
	end

	def create
		@link = Link.new(link_params)
		@user = User.find(params[:user_id])
		@link.id = @user.id
		@link.user_id = @user.id

		@link.link01_title = @user.name
		@link.link01_url = "https://www.circle-book.com/users/#{@user.id}"

		@link.save

		if @link.update(link_params)
			flash[:notice] = 'ID設定完了しました！'
			redirect_to link_path(@link)
		else
			render "edit"
		end	

	end

	def show
		@link = Link.find(params[:id])
		@user = User.find(params[:id])
		@sub_prefecture = Prefecture.find_by(id: @user.prefecture_sub_id)

		@users = User.prefecture(@user.prefecture_id).or(User.prefecture_sub(@user.prefecture_id)).event(@user.event_id).where(switch: "募集中").order(:last_post => :desc)

		@user_ages = @user.users_ages.map{|a| a.age}
		@user_groups = @user.users_groups.map{|g| g.group}
		@user_cities = @user.users_cities.map{|c| c.city}
	end

	def edit
		@link = Link.find(params[:id])

	end

	def update
		@link = Link.find(params[:id])
		if @link.update(link_params)
			flash[:notice] = '更新完了！'
			redirect_to link_path(@link)
		else
			render "edit"
		end	
	end

	def destroy

	end

private
	def link_params
		params.require(:link).permit(
			:unique_id, :link01_title, :link01_url, :link02_title, :link02_url, :link03_title, :link03_url, :link04_title, :link04_url, :link05_title, :link05_url
   		)
	end

	def set_linkes


		# if admin_user_signed_in?
		# 	@current_user = User.find_by(id: current_admin_user.id)
		# 	@current_link = Link.find_by(id: current_admin_user.id)
		# end


	end

	def ensure_correct_user
		# @link = Link.find(params[:id])
		
	 #   if current_admin_user.id != @link.user.admin_user_id.to_i
	 #   		if current_admin_user.id == 1   			
	   		
		#    	else
		#       flash[:notice] = "権限がありません"
		#       redirect_to linkes_path

		#     end
	 #   end
	end		


end
