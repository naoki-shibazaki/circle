class BlogsController < ApplicationController

	before_action :set_user, only: [:show, :edit, :update]
	before_action :ensure_correct_user, {only: [:edit, :update]}
	before_action :set_blog

	impressionist unique: [:session_hash]


	def index
	    @blogs = Blog.all.blog_sort.page(params[:page])

		# パンくず
		@b1_name = "ブログ"
		@b1_url = "/blogs"
	end	

	def top
	    @blogs = Blog.all.blog_sort.page(params[:page])

		# パンくず
		@b1_name = "ブログ"
		@b1_url = "/blogs"
	end	

	def new
		@blog = Blog.new
		@user = User.find(params[:user_id])
		@blog_button = "投稿する"
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
		@user = User.find_by(id: @blog.user_id)
		@blogs = Blog.where(user_id: @user.id).order(created_at: "DESC")
		@data = AdminUser.find_by(id: @blog.user.id)

		impressionist(@blog, nil, unique: [:session_hash])

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
	
		@mail_title = "【#{@user.name}】お問い合わせ"
		@mail_message = "#{@user.name}%20さん%0d%0a%0d%0aサークルブックより、お問い合わせです。%0d%0a%0d%0a--------------------------------------%0d%0a内容：参加希望／質問／その他%0d%0a名前：%0d%0a年齢：%0d%0aメッセージ：%0d%0a%0d%0a--------------------------------------%0d%0a%0d%0aこのメールに直接ご返信をお願いします。"

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


	def event
		@event = Event.find_by(ruby: params[:ruby])
		@users = User.event(@event.id).user_hide

		# パンくず
		@b1_name = "ブログ"
		@b1_url = "/blog"
		@b2_name = @event.name
		@b2_url = "/blog/#{@event.ruby}"	

	end

	def event_prefecture
		@event = Event.find_by(ruby: params[:ruby])
		@prefecture = Prefecture.find_by(kana: params[:kana])
		@users = User.prefecture(@prefecture.id).or(User.prefecture_sub(@prefecture.id)).or(User.prefecture_50).event(@event.id).user_hide

		# パンくず
		@b1_name = "ブログ"
		@b1_url = "/blog"
		@b2_name = @event.name
		@b2_url = "/blog/#{@event.ruby}"
		@b3_name = @prefecture.name
		@b3_url = "/blog/#{@event.ruby}/#{@prefecture.kana}"		
	end

	def prefecture_index
		# パンくず
		@b1_name = "ブログ"
		@b1_url = "/blog"
		@b2_name = "47都道府県ごとの活動ブログ"
		@b2_url = ""		
	end


	def prefecture
		@prefecture = Prefecture.find_by(kana: params[:kana])
		@users = User.prefecture(@prefecture.id).or(User.prefecture_sub(@prefecture.id)).or(User.prefecture_50).user_hide

		# パンくず
		@b1_name = "ブログ"
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
    	@users = User.all.user_hide
	    @blogs = Blog.all.order(created_at: "DESC")
    	@users_r = User.all.user_hide
	    @blogs_r = Blog.all.order(created_at: "DESC")
		@events = Event.all.where.not(id: 0).order(:order => :asc)
		@prefectures = Prefecture.all.order(:order => :asc).where.not(id: 0)	
		@x = "nil"
		@category = "nil"
		@blog_count = 0
		@contact_judge = "_b"


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
