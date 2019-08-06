class ApplicationController < ActionController::Base
	before_action :set_current_user	
	before_action :request_path
	before_action :set_data

	protect_from_forgery with: :exception

	  #herokuapp.comから独自ドメインへリダイレクト
	  before_filter :ensure_domain
	  FQDN = 'www.circle-book.com'
	 
	  # redirect correct server from herokuapp domain for SEO
	  def ensure_domain
	   return unless /\.herokuapp.com/ =~ request.host
	   
	   # 主にlocalテスト用の対策80と443以外でアクセスされた場合ポート番号をURLに含める 
	   port = ":#{request.port}" unless [80, 443].include?(request.port)
	   redirect_to "#{request.protocol}#{FQDN}#{port}#{request.path}", status: :moved_permanently
	  end

	  


	def set_current_user
    	@current_user = User.find_by(id: session[:user_id])
  	end

  	def authenticate_user
	    if @current_user == nil
	      flash[:notice] = "ログインが必要です"
	      redirect_to login_path
	    end
    end

    def forbid_login_user
	    if @current_user
	      flash[:notice] = "すでにログインしています"
	      redirect_to users_path
	    end
 	end

	def after_sign_in_path_for(resource)
	  	edit_user_path(current_admin_user)
	end

	def request_path
	    @path = controller_path + '#' + action_name
	    def @path.is(*str)
	        str.map{|s| self.include?(s)}.include?(true)
	    end
	end	

	def set_data
		@time = Time.now
		@url = request.url
		@count = 0

		@mail_title = "【サークルブック】新規のお問い合わせ"
		@mail_message = "ご担当者%20様%0d%0a%0d%0aサークルブックより新規のお問い合わせです。%0d%0a%0d%0a--------------------------------------%0d%0a内容：参加希望／質問／その他%0d%0a名前：%0d%0a年齢：%0d%0aメッセージ：%0d%0a%0d%0a--------------------------------------%0d%0a%0d%0aよろしくお願いいたします。"
	end

end