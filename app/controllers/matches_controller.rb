class MatchesController < ApplicationController

before_action :ensure_correct_user, {only: [:edit, :update]}
before_action :set_matches


	def index
		@matches = Match.all.order(updated_at: "DESC")
	end	

	def new
		@user = User.find(params[:user_id])

	    if admin_user_signed_in? #ログイン判定

	    	if @user.match.blank? #未登録
				
	    		if params[:count] == "new"
	    			flash[:notice] = "必要情報を登録してください"
	    		end

				@match = Match.new

				if @user.event.matching == 0
				    flash[:notice] = "#{@user.event.name}は登録できません"
				    redirect_to root_path
				end

			else #登録済み
				redirect_to edit_match_path(@user.id)
			end

    	else
		    flash[:notice] = "登録が必要です"
		    redirect_to root_path
    	end	

	end

	def create
		@match = Match.new(match_params)
		@user = User.find(params[:user_id])
		@match.id = @user.id
		@match.user_id = @user.id
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
		@user = User.find(params[:id])
		@match = Match.find_by(user_id: @user.id)

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
			@data = AdminUser.find_by(id: @user.admin_user_id)

			@mail_title = "【#{@user.name}】練習試合のお問い合わせ"
			@mail_message = "こちらにご記入ください！"

		else
		      flash[:notice] = "会員登録を行ってください"
		      redirect_to matches_path			
		end

	end


	def event
		@event = Event.find_by(ruby: params[:ruby])
		@users = User.where(event_id: @event.id)

		@matches = Match.where(user_id: @users.map { |user| user.id }).order(updated_at: "DESC")
 
		# パンくず		
		@b1_name = @event.name
		@b1_url = "/match/#{@event.ruby}"
	end

	def prefecture
		@prefecture = Prefecture.find_by(kana: params[:kana])
		@users = User.where(prefecture_id: @prefecture.id)
		@matches = Match.where(user_id: @users.map { |user| user.id }).order(updated_at: "DESC")

		# パンくず
		@b1_name = @prefecture.name
		@b1_url = "/prefectures/#{@prefecture.kana}"	
	end

	def event_prefecture
		@event = Event.find_by(ruby: params[:ruby])
		@prefecture = Prefecture.find_by(kana: params[:kana])
		@users = User.where(event_id: @event.id, prefecture_id: @prefecture.id)
		@matches = Match.where(user_id: @users.map { |user| user.id }).order(updated_at: "DESC")
		
		# パンくず
		@b1_name = @event.name
		@b1_url = "/#{@event.ruby}"
		@b2_name = @prefecture.name
		@b2_url = "/#{@event.ruby}/#{@prefecture.kana}"	
	end

private
	def match_params
		params.require(:match).permit(
			:age_group, :member, :level, :recruit, :comment
   		)
	end

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
		
	   if current_admin_user.id != @match.user.admin_user_id.to_i
	   		if current_admin_user.id == 1   			
	   		
		   	else
		      flash[:notice] = "権限がありません"
		      redirect_to matches_path

		    end
	   end
	end		



end
