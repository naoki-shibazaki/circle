class OpinionsController < ApplicationController

	def create
		@user = User.find_by(id: params[:user_id])
		@user.opinions.create(opinion_params)
		@opinion = @user.opinions.last

		if @opinion.save
			OpinionMailer.send_opinion(@opinion, @user).deliver
			flash[:notice] = "ご連絡ありがとうございます！"
			redirect_to "/check/thanks"
		else
			flash[:notice] = "必須項目が未記入です"
			redirect_to "/users/#{@user.id}/mypage"
		end

	end

private
	def opinion_params
		params.require(:opinion).permit(:opinion)
	end


end
