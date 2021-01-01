class UserContactsController < ApplicationController


	def create	
		@user = User.find_by(id: params[:user_id])
		@user.user_contacts.create(user_contact_params)
		@user_contact = @user.user_contacts.last

		if @user_contact.save
			# user_contactMailer.send_user_contact(@user_contact).deliver
			flash[:notice] = "お問い合わせありがとうございます！"
			redirect_to "/users/#{@user.id}"

		else
			flash[:notice] = "必須項目が未記入です"
			redirect_to "/users/#{@user.id}"
		end

	end

private
	def user_contact_params
		params.require(:user_contact).permit(:mail, :message)
	end
	
end
