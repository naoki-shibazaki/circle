class UserContactsController < ApplicationController


	def contact
		@user = User.find(params[:id])
    @data = AdminUser.find_by(id: @user.admin_user_id)
		@user_contact = @user.user_contacts.build

		@user.template = "名前： 例）サークルブック\r\n性別： 例）男\r\n年代： 例）30代\r\n経歴： 例）初心者\r\n" if @user.template.blank?
		@user_contact.message = @user.template

		@mail_title = "【#{@user.name}】お問い合わせ"
    @mail_message = "こちらにご記入ください！"

    if InvalidEmail.find_by(email: @data.email)
      @invalid = "無効"
    else
      @invalid = "有効"
    end

	end

	def create
		@user = User.find_by(id: params[:user_id])
		@user.user_contacts.create(user_contact_params)
		@user_contact = @user.user_contacts.last

		if @user_contact.save
			ContactMailer.send_contact(@user, @user_contact).deliver
			ContactMailer.send_member(@user, @user_contact).deliver

			if @user.sent_count.present?
				@user.sent_count = @user.sent_count + 1
			else
				@user.sent_count = 1
			end
			@user.save

			flash[:notice] = "お問い合わせありがとうございます！"
			redirect_to "/users/#{@user.id}/thanks"

		else
			flash[:notice] = "メールアドレスに誤りがあるか、メッセージに必ず日本語を含めてください"
			redirect_to "/users/#{@user.id}/contact"
		end

	end

	def thanks
		@user = User.find(params[:id])
    @users = User.ng_account.prefecture(@user.prefecture_id).event(@user.event_id).where(switch: "募集中").where.not(id: @user.id).order(:last_post => :desc)
	end


private
	def user_contact_params
		params.require(:user_contact).permit(:mail, :message)
	end
end
