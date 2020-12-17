class UserContactsController < ApplicationController


	def create	
		@user = User.find_by(id: params[:user_id])
		@user.opinions.create(opinion_params)
		@opinion = @user.opinions.last

		if @opinion.save
			OpinionMailer.send_opinion(@opinion).deliver
			flash[:notice] = "送信ありがとうございます！"
			redirect_to "/users/#{@user.id}/mypage"

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
