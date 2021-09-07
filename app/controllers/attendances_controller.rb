class AttendancesController < ApplicationController

  before_action :set_attendances


  def index

  end




  private
  def set_attendances
    @user = User.find(params[:user_id])
    @schedules = Schedule.where(user_id: @user.id).where("day > ?", DateTime.yesterday).order(:day => :asc)
  end


end
