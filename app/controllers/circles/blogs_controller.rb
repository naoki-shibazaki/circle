class Circles::BlogsController < Circles::ApplicationController
  include Circlebook

  def index
		@user = User.find(params[:circle_id])
    @blogs = @user.blogs.order(created_at: "DESC").page(params[:page])
  end

	def new
		@blog = Blog.new
		@user = User.find(params[:circle_id])

		if current_admin_user.users.find_by(id: params[:circle_id])

		else
			flash[:notice] = 'URLが間違っています'
			redirect_to blog_path
		end

	end

	def create
		@blog = Blog.new(blog_params)
		@user = User.find(params[:circle_id])
		@blog.user_id = @user.id
		@blog.save

		if @blog.update(blog_params)
      last_post(@user)
      cb_point(@user)
      @user.save

			flash[:notice] = 'ブログ投稿完了！'
			redirect_to circle_blog_path(@user, @blog)
		else
			render "new"
		end

	end

	def show
		@blog = Blog.find(params[:id])
		@user = User.find_by(id: params[:circle_id])
    @blogs = @user.blogs.where.not(id: params[:id])

    if @user.blogs.exists?(id: @blog.id)

    else
			flash[:notice] = 'URLが間違っています'
			redirect_to blogs_path
    end

	end


	def edit
    @blog = Blog.find(params[:id])
    @user = User.find(params[:circle_id])
  end

	def update
		@blog = Blog.find(params[:id])

		if @blog.update(blog_params)

			@user.user_time = Time.zone.now
      @user.save
			flash[:notice] = 'ブログ更新完了！'
			redirect_to circle_blog_path(@blog.user.id, @blog.id)
		else
			render "edit"
		end
	end

	def destroy
    @blog = Blog.find_by(id: params[:id])
    @blog.destroy
    cb_point(@blog.user)
    @blog.user.save

		flash[:notice] = 'ブログ削除完了'
		redirect_to("/")
	end


  private
  def blog_params
    params.require(:blog).permit(
      :title,
      :content,
      :image_01,
      :image_02,
      :image_03,
      :image_04,
      :remove_image_01, :remove_image_02, :remove_image_03, :remove_image_04,
      :image_name,
      :name,
      :requirement,
      :impressions_count
    )
  end

end