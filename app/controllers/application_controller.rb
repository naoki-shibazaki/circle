class ApplicationController < ActionController::Base
	before_action :set_current_user	
	before_action :set_imperfect_current_user
	before_action :request_path
	before_action :set_data


	#herokuapp.comから独自ドメインへリダイレクト
	before_action :ensure_domain
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

		if admin_user_signed_in?
			@admin_user = current_admin_user
	    	@questions_current = Question.where(user_id: current_admin_user.id)
	    	@questions_current_nil = Question.where(user_id: current_admin_user.id).where(answer: nil)
		end

  	end



  	# 登録未完了時のアクション
  	def set_imperfect_current_user

		if admin_user_signed_in? #ログイン判定

			if current_admin_user.users.any? # 登録1つ以上の判定

				# OK

			else

				if  controller_path == 'users' #users コントローラー

					if action_name == 'new' || action_name == 'create' || action_name == 'edit' || action_name == 'update' || action_name == 'edit2' || action_name == 'update2'

						# OK

					else
						flash[:notice] = "登録を完了させてください"
						redirect_to new_user_path		
					end

				else
						flash[:notice] = "登録を完了させてください"
						redirect_to new_user_path
				end		

			end

		end


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

		if admin_user_signed_in?
		  	new_user_path

	  	else member_signed_in?
	  		edit_member_path(current_member)
	  	end	

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

	end

end