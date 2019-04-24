class BlogsController < ApplicationController

	before_action :set_user, only: [:show, :edit, :update, :destroy]



	def index
		@users = User.all.order(updated_at: "DESC")
	end	


	def new
		@blog = Blog.new
	end

	def create
		@blog = Blog.new(blog_params)
		@blog.user_id = @current_user.id
		@blog.save

		if image = params[:blog][:image_01]
			@blog.image_01 = "#{@blog.id}_01.jpg"
		    File.binwrite("public/blog_images/#{@blog.image_01}",image.read)
		end

		if image = params[:blog][:image_02]
			@blog.image_02 = "#{@blog.id}_02.jpg"
		    File.binwrite("public/blog_images/#{@blog.image_02}",image.read)
		end

		if image = params[:blog][:image_03]
			@blog.image_03 = "#{@blog.id}_03.jpg"
		    File.binwrite("public/blog_images/#{@blog.image_03}",image.read)
		end

		if image = params[:blog][:image_04]
			@blog.image_04 = "#{@blog.id}_04.jpg"
		    File.binwrite("public/blog_images/#{@blog.image_04}",image.read)
		end

		@blog.save

	redirect_to blogs_path

	end

	def show
		@blog = Blog.find(params[:id])
		@user = User.find_by(id: @blog.user.id)

	end

	def edit
		
	end

	def destroy
		@user = User.find(params[:user_id])
		@blog = @user.blogs.find(params[:user_id])
		@blog.destroy

		redirect_to user_path(params[:user_id])

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
			:blog_image_name,
			:photo 
		)
	end



end
