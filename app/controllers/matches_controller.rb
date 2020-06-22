class MatchesController < ApplicationController

before_action :ensure_correct_user, {only: [:edit, :update]}
before_action :set_matches


	def index
		@matches = Match.all.order(updated_at: "DESC")
	end	

	def new

	    if admin_user_signed_in? #ログイン判定

	    	if @current_match.blank? #未登録
				
				@match = Match.new

			else #登録済み
				redirect_to edit_match_path(current_admin_user.id)
			end

    	else
		    flash[:notice] = "登録が必要です"
		    redirect_to root_path
    	end	

	end

	def create
		@match = Match.new(match_params)
		@match.id = current_admin_user.id
		@match.user_id = current_admin_user.id		
		@match.recruit = "募集中"
		@match.save

		if @match.update(match_params)
			flash[:share] = '登録完了！'
			redirect_to match_path(@match.id)
		else
			render "edit"
		end	


	end

	def show
		@match = Match.find(params[:id])
		@user = User.find(params[:id])
		@sub_prefecture = Prefecture.find_by(id: @user.prefecture_sub_id)

		# パンくず
		@b2_name = @match.user.name
		@b2_url = "/matches/#{@match.id}"
	end

	def edit
	end

	def update
		if @match.update(match_params)
			flash[:share] = '更新完了！'
			redirect_to match_path(@match.id)
		else
			render "edit"
		end	
	end

	def destroy
	end

	def contact

		if admin_user_signed_in?
			@match = Match.find(params[:id])
			@user = User.find(params[:id])
			@data = AdminUser.find_by(id: @user.id)

			@mail_title = "【#{@user.name}】練習試合のお問い合わせ"
			@mail_message = "こちらにご記入ください！"

		else
		      flash[:notice] = "会員登録を行ってください"
		      redirect_to matches_path			
		end

	end


private
	def set_matches
		if admin_user_signed_in?
			@current_user = User.find_by(id: current_admin_user.id)
			@current_match = Match.find_by(id: current_admin_user.id)
		end

		# パンくず
		@b1_name = "対戦相手募集"
		@b1_url = "/matches"
	end

	def ensure_correct_user
		@match = Match.find(params[:id])
		
	   if current_admin_user.id != @match.user_id.to_i
	   		if current_admin_user.id == 1   			
	   		
		   	else
		      flash[:notice] = "権限がありません"
		      redirect_to matches_path

		    end
	   end
	end		


	def match_params
		params.require(:match).permit(
			:age_group, :member, :level, :recruit, :comment
   		)
	end


end
