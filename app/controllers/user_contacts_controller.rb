class UserContactsController < ApplicationController
  before_action :set_users

  def new
    @user_contact = @user.user_contacts.build

    if params[:entry] == "1"
      @user_contact.entry = "見学"
    else
      @user_contact.entry = "参加"
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
      render "/user_contacts/edit"
		end

	end

	def thanks
    @users = User.ng_account.prefecture(@user.prefecture_id).event(@user.event_id).where(switch: "募集中").where.not(id: @user.id).order(:last_post => :desc)
	end

  def respond_check
    if UserContact.find_by(random_id: params[:random_id])
      @user_contact = UserContact.find_by(random_id: params[:random_id])

      if @user.id != @user_contact.user_id
        flash[:notice] = "URLが間違っています"
        redirect_to user_path(@user.id)
      end

    else
      flash[:notice] = "URLが間違っています"
			redirect_to user_path(@user.id)
    end

  end

  def update
    @user_contact = UserContact.find_by(id: params[:id])

		if @user_contact.update(user_contact_params)
			flash[:notice] = 'ご報告ありがとうございます！'
			redirect_to users_path
		else
      flash[:notice] = 'エラーです'
      redirect_to "/users/#{@user.id}/respond_check/#{@user_contact.random_id}"
		end

  end




private
	def user_contact_params
		params.require(:user_contact).permit(:mail, :name, :message, :entry, :respond_check, :random_id)
	end

	def set_users
    @user = User.find_by(id: params[:user_id])
    @respond_check_count = UserContact.where(user_id: @user.id, respond_check: "NG").count
    if InvalidEmail.find_by(email: @user.admin_user.email)
      @invalid = "無効"
    else
      @invalid = "有効"
    end

  end


end
