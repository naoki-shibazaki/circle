class UserContactsController < ApplicationController


	def create	
		@user = User.find_by(id: params[:user_id])
		@user.user_contacts.create(user_contact_params)
		@user_contact = @user.user_contacts.last

		if @user_contact.save
			ContactMailer.send_contact(@user, @user_contact).deliver

			if @user.sent_count.present?
				@user.sent_count = @user.sent_count + 1
			else
				@user.sent_count = 1
			end
			@user.save

			flash[:notice] = "お問い合わせありがとうございます！"
			redirect_to "/users/#{@user.id}"

		else
			flash[:notice] = "メールアドレスに誤りがあります"
			redirect_to "/users/#{@user.id}/contact_test"
		end

	end

private
	def user_contact_params
		params.require(:user_contact).permit(:mail, :message)
	end
	
end
