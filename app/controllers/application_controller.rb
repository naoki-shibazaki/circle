class ApplicationController < ActionController::Base
	before_action :set_current_user	
	before_action :request_path

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

end