class AttendancesController < ApplicationController

  before_action :set_attendances

  def index
    @attendance = Attendance.new
    @schedule_ids = Schedule.where(user_id: @user.id).where("day > ?", DateTime.yesterday).map { |s| s.id }
    @attendances = Attendance.where(schedule_id: @schedule_ids)

    # @members = Member.joins(:attendances).where("schedule_id = ?", @schedule_ids).preload(:attendances)


  end

  def create
    @attendance = Attendance.create(attendance_params)
    @attendance.schedule_id = params[:schedule_id]

    if member_signed_in?
      @attendance.member_id = current_member.id
    end


		if @attendance.save

			flash[:notice] = "追加しました"
			redirect_to user_attendances_path(@user)

		else
			flash[:notice] = "エラー"
			redirect_to user_attendances_path(@user)
		end

  end




  private
  def set_attendances
    @user = User.find(params[:user_id])
    @schedules = Schedule.where(user_id: @user.id).where("day > ?", DateTime.yesterday).order(:day => :asc)
  end

  def attendance_params
    params.require(:attendance).permit(:answer, :comment, :schedule_id, :member_id)
  end

end
