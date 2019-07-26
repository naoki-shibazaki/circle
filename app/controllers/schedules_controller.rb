class SchedulesController < ApplicationController


	def create
		@user = User.find(params[:user_id])		
		@user.schedules.create(schedule_params)
		redirect_to user_path(@user)
	end

	def destroy
		@user = User.find(params[:user_id])
		@schedule = @user.schedules.find(params[:id])
		@schedule.destroy
		redirect_to user_path(@user)
	end


	private
		def schedule_params
			params.require(:schedule).permit(:day, :venue, :s_user_id)
		end


end
