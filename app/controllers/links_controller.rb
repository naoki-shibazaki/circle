class LinksController < ApplicationController


# before_action :ensure_correct_user, {only: [:edit, :update]}
# before_action :set_links


	def index
	end	

	def new
		if admin_user_signed_in?

	    else
		  flash[:notice] = "ログインをしてください"
	      redirect_to "/admin_users/sign_in"
		end
	end

	def create

	end

	def show

	end

	def edit

	end

	def update

	end

	def destroy

	end

private
	def link_params
		params.require(:link).permit(
			:unique_id, :link01_title, :link01_url, :link02_title, :link02_url, :link03_title, :link03_url, :link04_title, :link04_url, :link05_title, :link05_url
   		)
	end

	def set_linkes


		# if admin_user_signed_in?
		# 	@current_user = User.find_by(id: current_admin_user.id)
		# 	@current_link = Link.find_by(id: current_admin_user.id)
		# end


	end

	def ensure_correct_user
		# @link = Link.find(params[:id])
		
	 #   if current_admin_user.id != @link.user.admin_user_id.to_i
	 #   		if current_admin_user.id == 1   			
	   		
		#    	else
		#       flash[:notice] = "権限がありません"
		#       redirect_to linkes_path

		#     end
	 #   end
	end		


end
