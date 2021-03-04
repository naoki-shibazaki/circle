class BlogsController < ApplicationController

	before_action :set_user, only: [:show, :edit, :update]
	before_action :ensure_correct_user, {only: [:edit, :update]}
	before_action :set_blog


	def index
    @blogs = Blog.all.blog_sort.page(params[:page])

		# パンくず
		@b1_name = "ブログ"
		@b1_url = "/blog"
	end


	def new
		@blog = Blog.new
		@user = User.find(params[:user_id])
		@blog_button = "投稿する"

		if @admin_user.users.find_by(id: params[:user_id])

		else
			flash[:notice] = 'URLが間違っています'
			redirect_to blog_path
		end

	end

	def create
		@blog = Blog.new(blog_params)
		@user = User.find(params[:user_id])
		@blog.user_id = @user.id
		@blog.save

		if @blog.update(blog_params)

			@user.last_post = Time.now
			@user.user_time = Time.now
      @user.save

			flash[:notice] = 'ブログ投稿完了！'
			redirect_to user_blog_path(@user, @blog)
		else
			render "/blogs/edit"
		end

	end

	def show
		@blog = Blog.find(params[:id])
		@user = User.find_by(id: params[:user_id])
		@blogs = Blog.where(user_id: @user.id).where.not(id: @blog.id).order(created_at: "DESC")
		@data = AdminUser.find_by(id: @blog.user.id)

		if @blog.user_id != @user.id
			flash[:notice] = 'URLが間違っています'
			redirect_to blog_path
		end

		if admin_user_signed_in?
		else
			impressionist(@blog, nil, unique: [:session_hash])
		end

		# パンくず
		if @user.switch.present?
			@b1_name = "ブログ"
			@b1_url = "/blog"
			@b2_name = "#{@user.event.name}"
			@b2_url = "/blog/#{@user.event.ruby}"
			@b3_name = "#{@user.prefecture.name}"
			@b3_url = "/blog/#{@user.event.ruby}/#{@user.prefecture.kana}"
			@b4_name = "#{@blog.title}"
			@b4_url = ""
		end

	end


	def user_blogs
		@user = User.find_by(id: params[:user_id])
		@blogs = Blog.where(user_id: @user.id).order(created_at: "DESC").page(params[:page])

		# パンくず
			@b1_name = "#{@user.name}"
			@b1_url = "/users/#{@user.id}"
			@b2_name = "ブログ一覧"
			@b2_url = ""

	end


	def show_redirect # 旧ブログ用のリダイレクト
		@blog = Blog.find(params[:id])
		redirect_to "/users/#{@blog.user_id}/blogs/#{@blog.id}"
	end


	def edit
		@blog = Blog.find(params[:id])
		@blog_button = "編集する"
	end

	def update
		@blog = Blog.find(params[:id])

		if @blog.update(blog_params)

			@user.user_time = Time.now
      @user.save
			flash[:notice] = 'ブログ更新完了！'
			redirect_to user_blog_path(@blog.user.id, @blog.id)
		else
			render "/blogs/edit"
		end
	end

	def destroy
    @blog = Blog.find_by(id: params[:id])
    @blog.destroy

		flash[:notice] = 'ブログ削除完了'
		redirect_to("/")
	end


	def event
		@event = Event.find_by(ruby: params[:ruby])
		@users = User.event(@event.id).user_hide
		@users_id = @users.map{|u| u.id}
		@blogs = Blog.where(user_id: @users_id).blog_sort.page(params[:page])

		# パンくず
		@b1_name = "ブログ"
		@b1_url = "/blog"
		@b2_name = @event.name
		@b2_url = "/blog/#{@event.ruby}"

	end

	def prefecture
		@prefecture = Prefecture.find_by(kana: params[:kana])
		@users = User.prefecture(@prefecture.id).or(User.prefecture_sub(@prefecture.id)).user_hide
		@users_id = @users.map{|u| u.id}
		@blogs = Blog.where(user_id: @users_id).blog_sort.page(params[:page])

		# パンくず
		@b1_name = "ブログ"
		@b1_url = "/blog"
		@b2_name = @prefecture.name
		@b2_url = "/blog/prefectures/#{@prefecture.kana}"

	end

	def event_prefecture
		@event = Event.find_by(ruby: params[:ruby])
		@prefecture = Prefecture.find_by(kana: params[:kana])
		@users = User.prefecture(@prefecture.id).or(User.prefecture_sub(@prefecture.id)).event(@event.id).user_hide
		@users_id = @users.map{|u| u.id}
		@blogs = Blog.where(user_id: @users_id).blog_sort.page(params[:page])

		# パンくず
		@b1_name = "ブログ"
		@b1_url = "/blog"
		@b2_name = @event.name
		@b2_url = "/blog/#{@event.ruby}"
		@b3_name = @prefecture.name
		@b3_url = "/blog/#{@event.ruby}/#{@prefecture.kana}"
	end

	def prefecture_index
	redirect_to blog_path
	end

  def gallery
    @blogs = Blog.where(user_id: params[:user_id]).order(created_at: "DESC")
    @user = User.find(params[:user_id])
  end


	private
	def set_user
    @user = User.where(:id => params[:user_id]).first
    @blog = Blog.where(:id => params[:id]).first
  end

  def set_blog
  @users = User.all.user_hide
  @blogs = Blog.all.order(created_at: "DESC")
  @users_r = User.all.user_hide
  @blogs_r = Blog.all.order(created_at: "DESC")
  @events = Event.all.where.not(id: 0).order(:order => :asc)
  @prefectures = Prefecture.all.order(:order => :asc).where.not(id: 0)
  @x = "nil"
  @category = "nil"
  @contact_judge = "_b"

		if admin_user_signed_in?
			@admin_user = current_admin_user
			@user = User.find_by(id: @admin_user.users.first.id)
		end

  end

	def ensure_correct_user
		@blog = Blog.find(params[:id])
		@user = User.find(params[:user_id])

    if current_admin_user.id == @user.admin_user_id.to_i

    else
      if current_admin_user.id == 1
        else
          flash[:notice] = "権限がありません"
          redirect_to blog_path
        end
      end
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
			:name,
			:requirement,
      :impressions_count
		)
	end



end
