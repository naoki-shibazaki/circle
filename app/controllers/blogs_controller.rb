class BlogsController < ApplicationController

	before_action :set_user, only: [:show, :edit, :update, :destroy]



	def index
		@users = User.all.order(updated_at: "DESC").page(params[:page]).per(10)
	end	


	def new
		@blog = Blog.new
		@blog_button = "投稿する"
	end

	def create
		@blog = Blog.new(blog_params)
		@blog.user_id = current_admin_user.id
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
		@blog = Blog.find(params[:id])
	end

	def update
		@blog = Blog.find(params[:id])

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

		if @blog.save
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
		)
	end



end
