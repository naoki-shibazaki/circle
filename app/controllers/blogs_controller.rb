class BlogsController < ApplicationController

	before_action :set_user, only: [:show, :edit, :update, :destroy]
	before_action :ensure_correct_user, {only: [:edit, :update]}
	before_action :set_blog


	def index
		# パンくず
		@b1_name = "活動ブログ"
		@b1_url = "/blogs"
	end	

	def top
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
			
			flash[:share] = 'ブログ投稿完了！'
			redirect_to blog_path(@blog.id)
		else
			render "/blogs/edit"
		end	

	end

	def show
		@blog = Blog.find(params[:id])
		@user = User.find_by(id: @blog.user.id)
		@blogs = Blog.where(user_id: @user.id).order(created_at: "DESC")
		@data = AdminUser.find_by(id: @blog.user.id)

		# パンくず
		@b1_name = "活動ブログ"
		@b1_url = "/blog"
		@b2_name = "#{@user.event.name}"
		@b2_url = "/blog/#{@user.event.ruby}"
		@b3_name = "#{@user.prefecture.name}"
		@b3_url = "/blog/#{@user.event.ruby}/#{@user.prefecture.kana}"	
		@b4_name = "#{@blog.title.truncate(4)}"
		@b4_url = ""		
	end

	def edit
		@blog = Blog.find(params[:id])
		@blog_button = "編集する"
	end

	def update
		@blog = Blog.find(params[:id])

		if @blog.update(blog_params)
			flash[:share] = 'ブログ更新完了！'
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


	def ensure_correct_user
		@blog = Blog.find(params[:id])
		
	   if current_admin_user.id != @blog.user_id.to_i
	   		if current_admin_user.id == 1   			
	   		
		   	else
		      flash[:notice] = "権限がありません"
		      redirect_to blogs_path

		    end
	   end
	end	


	def event
		@event = Event.find_by(ruby: params[:ruby])
		@users = User.where(event_id: @event.id).where.not(switch: "nil")

		# パンくず
		@b1_name = "活動ブログ"
		@b1_url = "/blog"
		@b2_name = @event.name
		@b2_url = "/blog/#{@event.ruby}"	

	end

	def event_prefecture
		@event = Event.find_by(ruby: params[:ruby])
		@prefecture = Prefecture.find_by(kana: params[:kana])
		@users = User.where(event_id: @event.id, prefecture_id: @prefecture.id).where.not(switch: "nil")

		# パンくず
		@b1_name = "活動ブログ"
		@b1_url = "/blog"
		@b2_name = @event.name
		@b2_url = "/blog/#{@event.ruby}"
		@b3_name = @prefecture.name
		@b3_url = "/blog/#{@event.ruby}/#{@prefecture.kana}"		
	end

	def prefecture_index
		# パンくず
		@b1_name = "活動ブログ"
		@b1_url = "/blog"
		@b2_name = "47都道府県ごとの活動ブログ"
		@b2_url = ""		
	end


	def prefecture
		@prefecture = Prefecture.find_by(kana: params[:kana])
		@users = User.where(prefecture_id: @prefecture.id).where.not(switch: "nil")

		# パンくず
		@b1_name = "活動ブログ"
		@b1_url = "/blog"
		@b2_name = @prefecture.name
		@b2_url = "/blog/prefectures/#{@prefecture.kana}"	

	end




	private
	def set_user
	    @user = User.where(:id => params[:user_id]).first
	    @blog = Blog.where(:id => params[:id]).first
    end

    def set_blog
    	@users = User.all.where.not(switch: "nil").page(params[:page])
	    @blogs = Blog.all.order(created_at: "DESC").page(params[:page])
    	@users_r = User.all.where.not(switch: "nil").page(params[:page])
	    @blogs_r = Blog.all.order(created_at: "DESC").page(params[:page])	    
		@events = Event.all.where.not(id: 0).order(:order => :asc)
		@prefectures = Prefecture.all.where.not(id: 0)	
		@x = "nil"
		@blog_count = 0

		if admin_user_signed_in?
			@user = User.find_by(id: current_admin_user.id)
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
			:name
		)
	end



end
