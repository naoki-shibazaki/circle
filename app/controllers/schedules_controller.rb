class SchedulesController < ApplicationController

before_action :set_schedules

	def index
		@b1_name = @user.name
		@b1_url = "/users/#{@user.id}"
		@b2_name = "活動スケジュール"
		@b2_url = ""		
	end

	def create
		# @user = User.find(params[:user_id])		
		@user.schedules.create(schedule_params)

		@user.last_post = @time
		@user.save

		redirect_to user_schedules_path
		# redirect_to user_path(@user)
	end

	def show
		@schedule = Schedule.find(params[:id])


		@b1_name = @user.name
		@b1_url = "/users/#{@user.id}"
		@b2_name = "活動スケジュール"
		@b2_url = "/users/#{@user.id}/schedules"
		@b3_name = Time.parse(@schedule.day).strftime("%-m/%-d(#{%w(日 月 火 水 木 金 土)[Time.parse(@schedule.day).wday]})")
		@b3_url = ""			
	end	

	def destroy
		# @user = User.find(params[:user_id])
		@schedule = @user.schedules.find(params[:id])
		@schedule.destroy
		# redirect_to user_path(@user)

		redirect_to user_schedules_path
	end


	private
		def schedule_params
			params.require(:schedule).permit(:day, :venue, :date, :time_s, :time_e, :venue_address, :note)
		end

	def set_schedules
		@user = User.find(params[:user_id])		
		@schedules = Schedule.where(user_id: @user.id).where("day > ?", DateTime.yesterday).order(:day => :asc)
		@data = AdminUser.find_by(id: params[:user_id])

		@mail_title = "【#{@user.name}】お問い合わせ"
		@mail_message = "こちらに相談内容をご記入ください！"
	end



end