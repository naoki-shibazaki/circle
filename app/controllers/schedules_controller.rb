class SchedulesController < ApplicationController

before_action :ensure_correct_user, {only: [:edit, :update, :new]}
before_action :set_schedules, {except: [:secret, :attendance, :attendance_create, :attendance_update]}
before_action :set_attendances, {only: [:secret, :attendance, :attendance_create, :attendance_update]}


	def index
		@schedule = @user.schedules.build

		@b1_name = @user.name
		@b1_url = "/users/#{@user.id}"
		@b2_name = "活動スケジュール"
		@b2_url = ""
	end

  def new
		@schedule = @user.schedules.build
    @btn_name = "新規作成"

		@b1_name = @user.name
		@b1_url = "/users/#{@user.id}"
		@b2_name = "活動スケジュール"
		@b2_url = ""
  end

	def create
    @schedule = @user.schedules.new(schedule_params)

		if @schedule.save

      @schedule = Schedule.where(user_id: @user.id).last
      @schedule.date = Time.parse(@schedule.day).strftime("%Y年%-m月%-d日(#{%w(日曜日 月曜日 火曜日 水曜日 木曜日 金曜日 土曜日)[Time.parse(@schedule.day).wday]})")
      @schedule.save

      @user.user_time = Time.now
      @user.last_post = Time.now
      @user.save

      flash[:notice] = "追加しました！"
      redirect_to user_schedules_path
    else
      render "new"
    end

  end

	def update
		@schedule = Schedule.find(params[:id])

		if @schedule.update(schedule_params)

			@user.user_time = Time.now
      @user.save

			flash[:notice] = '更新完了！'
			redirect_to user_schedules_path
		else
			render "edit"
		end
	end


	def show
		@schedule = Schedule.find(params[:id])

		if @schedule.title.present?
			@schedule_title = @schedule.title.gsub(/[^！？!?ー〜0-9A-Za-z-ぁ-んァ-ン一-龥]/, '')
		else
			@schedule_title = @user.event.name
		end

		if @user.id.to_i != @schedule.user_id.to_i
			flash[:notice] = "存在しないURLです"
			redirect_to "/users"
		end


		@b1_name = @user.name
		@b1_url = "/users/#{@user.id}"
		@b2_name = "活動スケジュール"
		@b2_url = "/users/#{@user.id}/schedules"
		@b3_name = Time.parse(@schedule.day).strftime("%Y/%-m/%-d(#{%w(日 月 火 水 木 金 土)[Time.parse(@schedule.day).wday]})")
		@b3_url = ""
	end

	def secret
		@schedule = Schedule.find(params[:id])
    @user = User.find_by(unique_id: params[:unique_id])
    @schedules = Schedule.where(user_id: @user.id).where("day > ?", DateTime.yesterday).order(:day => :asc)
    @past_schedules = Schedule.where(user_id: @user.id).where("day < ?", DateTime.yesterday).order(:day => :desc)
    @data = AdminUser.find_by(id: params[:user_id])
    @prefectures = Prefecture.all
    @schedule_month = 0
    @schedule_m_c = 0
    @contact_judge = "_s"

		if @schedule.title.present?
			@schedule_title = @schedule.title.gsub(/[^！？!?ー〜0-9A-Za-z-ぁ-んァ-ン一-龥]/, '')
		else
			@schedule_title = @user.event.name
		end

		if @user.id.to_i != @schedule.user_id.to_i
			flash[:notice] = "存在しないURLです"
			redirect_to "/users"
		end


		@b1_name = @user.name
		@b1_url = "/users/#{@user.id}"
		@b2_name = "活動スケジュール"
		@b2_url = "/users/#{@user.id}/schedules"
		@b3_name = Time.parse(@schedule.day).strftime("%Y/%-m/%-d(#{%w(日 月 火 水 木 金 土)[Time.parse(@schedule.day).wday]})")
		@b3_url = ""
	end

	def edit
		@schedule = Schedule.find(params[:id])
    @btn_name = "更新する"

		@b1_name = @user.name
		@b1_url = "/users/#{@user.id}"
		@b2_name = "活動スケジュール"
		@b2_url = "/users/#{@user.id}/schedules"
		@b3_name = Time.parse(@schedule.day).strftime("%Y/%-m/%-d(#{%w(日 月 火 水 木 金 土)[Time.parse(@schedule.day).wday]})")
		@b3_url = ""
	end

	def destroy
		@schedule = @user.schedules.find(params[:id])
		@schedule.destroy

		flash[:notice] = "削除しました"
		redirect_to user_schedules_path
	end


# 出欠機能

def attendance
  @name = Name.new
  @name_schedules = @name.name_schedules.build
  @schedule_ids = @schedules.map{|s| s.id}
  @name_ids = NameSchedule.where(schedule_id: @schedule_ids).map{|n| n.name_id}
  @names = Name.where(id: @name_ids).order(updated_at: :desc)
end

def attendance_create
  @name = Name.create(name_params)

  if @name.save
    flash[:notice] = "追加しました"
    redirect_back(fallback_location: "users/#{@user.id}/schedule")
  else
    flash[:notice] = "エラー"
    redirect_back(fallback_location: "users/#{@user.id}/schedule")
  end

end

def attendance_update
  @name = Name.find(params[:id])
  @name.update(name_params)

  if @name.save
    flash[:notice] = "更新しました"
    redirect_back(fallback_location: "users/#{@user.id}/schedule")
  else
    flash[:notice] = "エラー"
    redirect_back(fallback_location: "users/#{@user.id}/schedule")
  end

end



	private
		def set_schedules
			@user = User.find(params[:user_id])
			@schedules = Schedule.where(user_id: @user.id).where("day > ?", DateTime.yesterday).order(:day => :asc)
			@past_schedules = Schedule.where(user_id: @user.id).where("day < ?", DateTime.yesterday).order(:day => :desc)
			@data = AdminUser.find_by(id: params[:user_id])
			@prefectures = Prefecture.all
			@schedule_month = 0
			@schedule_m_c = 0
			@contact_judge = "_s"

			@mail_title = "【#{@user.name}】お問い合わせ"
			@mail_message = "こちらに相談内容をご記入ください！"
		end

    def set_attendances
      @user = User.find_by(unique_id: params[:unique_id])
			@schedules = Schedule.where(user_id: @user.id).where("day > ?", DateTime.yesterday).order(:day => :asc)
			@past_schedules = Schedule.where(user_id: @user.id).where("day < ?", DateTime.yesterday).order(:day => :desc)
    end



		def ensure_correct_user
			@user = User.find(params[:user_id])

      if current_admin_user.id.to_i == @user.admin_user_id.to_i

      elsif current_admin_user.id == 1

			else
        flash[:notice] = "権限がありません"
        redirect_to users_path

			end
		end

		def schedule_params
			params.require(:schedule).permit(:day, :venue, :date, :time_s, :time_e, :venue_address, :note, :title, :google_map, :recruitment, :member_venue, :recruitment_numbers)
		end

    def name_params
			params.require(:name).permit(:name, schedule_ids:[], name_schedules_attributes: [:answer, :comment, :schedule_id, :name_id, :_destroy, :id])
		end


end