class UserContactsController < ApplicationController
  before_action :set_users, except: [:account_block]

  def new
    @user_contact = @user.user_contacts.build

    # 荒らし対応
    @account_block = UserContact.where(ip_address: request.remote_ip, account_block: "block")
    if @account_block.present?
      @db_validation_error = DbValidationError.new
      @db_validation_error.name = "UserContact_block"
      @db_validation_error.content_01 = request.remote_ip
      @db_validation_error.save

      flash[:notice] = "アカウントをロックしました"
      redirect_to account_block_path
    end

    if params[:entry] == "1"
      @user_contact.entry = "見学"
      @user.template = "性別： 例）男\r\n年代： 例）30代\r\n経歴： 例）初心者\r\n" if @user.template.blank?
    elsif params[:entry] == "2"
      @user_contact.entry = "練習試合"
      @user.template = "種　目：例）バスケ\r\nエリア：例）東京都\r\n年齢層：例）30代中心\r\n構　成：例）10名程度\r\nレベル：例）初心者多め\r\n"
    else
      @user_contact.entry = "参加"
      @user.template = "性別： 例）男\r\n年代： 例）30代\r\n経歴： 例）初心者\r\n" if @user.template.blank?
    end

    @user_contact.message = @user.template

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
    @user_contact.ip_address = request.remote_ip

    # 荒らし対応
    @same_contacts = UserContact.where(ip_address: @user_contact.ip_address, message: @user_contact.message)
    if @same_contacts.count >= 6 # 7回目からブロック
      @user_contact.account_block = "block"
    end

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
      # バリデーションエラー値の保存
      @db_validation_error = DbValidationError.new
      @db_validation_error.name = "UserContact" + "_#{@user_contact.entry}"
      @db_validation_error.content_01 = @user_contact.name
      @db_validation_error.content_02 = @user_contact.mail
      @db_validation_error.content_03 = @user_contact.message
      @db_validation_error.save
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

  def account_block

  end




private
	def user_contact_params
		params.require(:user_contact).permit(:mail, :name, :message, :entry, :respond_check, :random_id, :ip_address, :account_block)
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
