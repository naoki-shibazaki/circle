class BlogsController < ApplicationController

	before_action :set_user, only: [:show, :edit, :update, :destroy]



	def index
		@blogs = Blog.all.order(updated_at: "DESC").page(params[:page]).per(10)

		# パンくず
		@b1_name = "活動ブログ"
		@b1_url = "/blogs"
	end	


	def new
		@blog = Blog.new
		@blog_button = "投稿する"
	end

	def create
		@blog = Blog.new(blog_params)
		@blog.user_id = current_admin_user.id
		@blog.save

		if @blog.update(blog_params)

			@user = User.find_by(id: current_admin_user.id)
			@user.last_post = @blog.created_at
			@user.save

			redirect_to blogs_path
		else
			render "/blogs/edit"
		end	

	end

	def show
		@blog = Blog.find(params[:id])
		@user = User.find_by(id: @blog.user.id)
		@data = AdminUser.find_by(id: @blog.user.id)

		# パンくず
		@b1_name = "活動ブログ"
		@b1_url = "/blogs"
		@b2_name = "#{@blog.title.truncate(18)}"
		@b2_url = ""
	end

	def edit
		@blog = Blog.find(params[:id])
		@blog_button = "編集する"
	end

	def update
		@blog = Blog.find(params[:id])

		if @blog.update(blog_params)
			redirect_to blog_path
		else
			render "/blogs/edit"
		end	
	end

	def destroy
	    @blog = Blog.find_by(id: params[:id])
   		@blog.destroy		

		redirect_to("/")
	end


	private
	def set_user
	    @user = User.where(:id => params[:user_id]).first
	    @blog = Blog.where(:id => params[:id]).first
    end

	def blog_params
		params.require(:blog).permit(
			:title, 
			:content,	
			:image_01,
			:image_02,
			:image_03,
			:image_04,
			:image_name,
			:name
		)
	end



end
