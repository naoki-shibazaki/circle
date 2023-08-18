class Circles::CirclesController < Circles::ApplicationController
  before_action :set_search, only: [:index]

	def index
		@search = User.ransack(params[:q])

		# ソート機能
    if params[:sort] == "1" || params[:sort] == nil
      @users = @search.result.user_sort_1.page(params[:page])
    elsif params[:sort] == "2"
      @users = User.user_sort_2.page(params[:page])
    else params[:sort] == "3"
      @users = User.user_sort_3.page(params[:page])
    end

  end


  def show
		@user = User.find(params[:id])
		@sub_prefecture = Prefecture.find_by(id: @user.prefecture_sub_id)
		@schedules = Schedule.where(user_id: @user.id).where("day > ?", DateTime.yesterday).order(:day => :asc)
		@questions = Question.where(user_id: @user.id).where.not(answer: nil).order(created_at: "DESC")

    @admin_user = AdminUser.find(@user.admin_user.id)

    @user_cities = @user.users_cities.includes([city: :prefecture]).map{|c| c.city}
    @user_groups = @user.users_groups.includes([:group]).map{|g| g.group}
		@user_ages = @user.users_ages.includes([:age]).map{|a| a.age}

		@users = User.ng_account.prefecture(@user.prefecture_id).event(@user.event_id).where(switch: "募集中").where.not(id: @user.id).order(:last_post => :desc).limit(5)
  end



end