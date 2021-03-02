class UserContactsController < ApplicationController
  before_action :set_users

  def new
    @user_contact = @user.user_contacts.build

    if params[:entry] == "1"
      @user_contact_entry = "見学"
    else
      @user_contact_entry = "参加"
    end

    @user.template = "性別： 例）男\r\n年代： 例）30代\r\n経歴： 例）初心者\r\n" if @user.template.blank?
    @user_contact.message = @user.template

    @mail_title = "【#{@user.name}】お問い合わせ"
    @mail_message = "こちらにご記入ください！"

  end

  def edit
  end

  def index
    redirect_to new_user_user_contact_path(@user)
  end


	def create
		@user.user_contacts.create(user_contact_params)
		@user_contact = @user.user_contacts.last
    @user_contact.random_id = SecureRandom.alphanumeric(16)

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
			flash[:notice] = "メールアドレスに誤りがあるか、NGワードが含まれています"
      render "/user_contacts/edit"
		end

	end

	def thanks
		@user = User.find(params[:id])
    @users = User.ng_account.prefecture(@user.prefecture_id).event(@user.event_id).where(switch: "募集中").where.not(id: @user.id).order(:last_post => :desc)
	end


private
	def user_contact_params
		params.require(:user_contact).permit(:mail, :name, :message, :entry, :respond_check, :random_id)
	end

	def set_users
    @user = User.find_by(id: params[:user_id])
    if InvalidEmail.find_by(email: @user.admin_user.email)
      @invalid = "無効"
    else
      @invalid = "有効"
    end

  end


end
