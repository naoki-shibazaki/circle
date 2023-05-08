class AttendancesController < ApplicationController

include Circlebook

before_action :set_attendances

# before_action :ensure_correct_user, {only: [:edit, :update, :new]}
# before_action :set_schedules, {except: [:secret, :attendance, :attendance_create, :attendance_update, :attendance_delete, :dates, :day, :year, :month]}
# before_action :set_attendances, {only: [:secret, :attendance, :attendance_create, :attendance_update, :attendance_delete]}
# before_action :set_dates, {only: [:dates, :day]}


	def index

    if params[:archive] == "1"
      @schedules = Schedule.where(user_id: @user.id).where("day <= ?", DateTime.yesterday).limit(5).order(:day => :desc)
    else
      @schedules = Schedule.where(user_id: @user.id).where("day > ?", DateTime.yesterday).order(:day => :asc, :time_s => :asc)
    end

    @past_schedules = Schedule.where(user_id: @user.id).where("day <= ?", DateTime.yesterday).order(:day => :desc, :time_s => :asc).page(params[:page])


    @name = Name.new
    @name_schedules = @name.name_schedules.build

    @today = DateTime.yesterday

    # ▼@nemesの取得
    @schedule_ids = @schedules.map{|s| s.id}
    @name_ids = NameSchedule.where(schedule_id: @schedule_ids).map{|n| n.name_id}
    @names = Name.where(id: @name_ids).order(updated_at: :desc)
  end

  def new
    @name = Name.new
    @name_schedules = @name.name_schedules.build
    @schedules = Schedule.where(user_id: @user.id).where("day > ?", DateTime.yesterday).order(:day => :asc, :time_s => :asc)

  end

	def create
    @name = Name.create(name_params)
    @schedules = Schedule.where(user_id: @user.id).where("day > ?", DateTime.yesterday).order(:day => :asc, :time_s => :asc)

    if @name.save
      flash[:notice] = "追加しました"
      redirect_to attendances_path(@user.unique_id)
    else
      flash[:notice] = "エラー"
      render "new"
    end

  end


	# def show
	# end

	def edit
    @name = Name.find(params[:id])
    @schedules = Schedule.where(user_id: @user.id).where("day > ?", DateTime.yesterday).order(:day => :asc, :time_s => :asc)
	end

	def update
    @name = Name.find(params[:id])
    @name.update(name_params)
    @name.updated_at = Time.now

    if @name.save
      flash[:notice] = "更新しました"
      redirect_to attendances_path(@user.unique_id)
    else
      flash[:notice] = "エラー"
      render "edit"
    end
	end

	def destroy
    @name = Name.find(params[:id])
    @name.destroy

    flash[:notice] = "削除しました"
    redirect_to attendances_path(@user.unique_id)
	end






private
  def set_attendances
    @user = User.find_by(unique_id: params[:unique_id])
    gallery_counts(@user)
    # @schedules = Schedule.where(user_id: @user.id).where("day > ?", DateTime.yesterday).order(:day => :asc, :time_s => :asc)
    # @past_schedules = Schedule.where(user_id: @user.id).where("day <= ?", DateTime.yesterday).order(:day => :desc, :time_s => :asc)
  end


  def set_schedules
    @user = User.find(params[:user_id])
    gallery_counts(@user)
    @schedules = Schedule.where(user_id: @user.id).where("day > ?", DateTime.yesterday).order(:day => :asc, :time_s => :asc)
    @past_schedules = Schedule.where(user_id: @user.id).where("day <= ?", DateTime.yesterday).order(:day => :desc, :time_s => :asc).page(params[:page])
    @data = AdminUser.find_by(id: params[:user_id])
    @prefectures = Prefecture.all
    @schedule_month = 0
    @schedule_m_01 = 0
    @schedule_m_02 = 0
    @wdays =  ["日", "月", "火", "水", "木", "金", "土" ]

    @mail_title = "【#{@user.name}】お問い合わせ"
    @mail_message = "こちらに相談内容をご記入ください！"
  end



  def set_dates
    @wdays =  ["日", "月", "火", "水", "木", "金", "土" ]
    if admin_user_signed_in?
      @user = current_admin_user.users.last
    end
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
    params.require(:schedule).permit(:day, :venue, :date, :time_s, :time_e, :venue_address, :note, :title, :google_map, :recruitment, :member_venue, :recruitment_numbers, :cost, :top_image)
  end

  def name_params
    params.require(:name).permit(:name, :gender, schedule_ids:[], name_schedules_attributes: [:answer, :comment, :schedule_id, :name_id, :_destroy, :id])
  end


end