class SchedulesController < ApplicationController

before_action :ensure_correct_user, {only: [:edit, :update]}
before_action :set_schedules

	def index

		@schedule = @user.schedules.build

		@b1_name = @user.name
		@b1_url = "/users/#{@user.id}"
		@b2_name = "活動スケジュール"
		@b2_url = ""		
	end

	def create	
		@user.schedules.create(schedule_params)

		@user.user_time = Time.now
		if @user.save

			flash[:notice] = "追加しました"
			redirect_to user_schedules_path

		else
			flash[:notice] = "必須項目が未記入です"
			redirect_to user_schedules_path
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
			@schedule_title = @schedule.title.gsub(/[^！？!?ー0-9A-Za-z-ぁ-んァ-ン一-龥]/, '')
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
		@b3_name = Time.parse(@schedule.day).strftime("%-m/%-d(#{%w(日 月 火 水 木 金 土)[Time.parse(@schedule.day).wday]})")
		@b3_url = ""			
	end	

	def edit
		@schedule = Schedule.find(params[:id])

		@b1_name = @user.name
		@b1_url = "/users/#{@user.id}"
		@b2_name = "活動スケジュール"
		@b2_url = "/users/#{@user.id}/schedules"
		@b3_name = Time.parse(@schedule.day).strftime("%-m/%-d(#{%w(日 月 火 水 木 金 土)[Time.parse(@schedule.day).wday]})")
		@b3_url = ""		
	end

	def destroy
		@schedule = @user.schedules.find(params[:id])
		@schedule.destroy

		flash[:notice] = "削除しました"
		redirect_to user_schedules_path
	end


	private 	
		def set_schedules
			@user = User.find(params[:user_id])		
			@schedules = Schedule.where(user_id: @user.id).where("day > ?", DateTime.yesterday).order(:day => :asc)
			@data = AdminUser.find_by(id: params[:user_id])
			@prefectures = Prefecture.all
			@schedule_month = 0
			@schedule_m_c = 0
			@contact_judge = "_s"

			@mail_title = "【#{@user.name}】お問い合わせ"
			@mail_message = "こちらに相談内容をご記入ください！"
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
			params.require(:schedule).permit(:day, :venue, :date, :time_s, :time_e, :venue_address, :note, :title)
		end



end