class TagsController < ApplicationController

before_action :set_tags


	def event
		@event = Event.find_by(ruby: params[:ruby])

		if @tag.category == "group"
			@users = User.where(id: @tag_users).or(User.where('grouping like?', "%#{@group.name}%")).where(event_id: @event.id).order(:last_post => :desc).where.not(switch: "").page(params[:page])
		else @tag.category == "age"
			@users = User.where(id: @tag_users).or(User.where('average_age like?', "%#{@age.name}%")).where(event_id: @event.id).order(:last_post => :desc).where.not(switch: "").page(params[:page])
		end


		# パンくず		
		@b1_name = @event.name
		@b1_url = "/#{@event.ruby}"
		@b2_name = @tag.name
		@b2_url = "/#{@event.ruby}/tag/#{@tag.id}"
	end


	def set_tags
		@tag = Tag.find(params[:id])
		@events = Event.all.where.not(id: 0).order(:order => :asc)
		@prefectures = Prefecture.all.order(:order => :asc).where.not(id: 0)
		@cities = City.all.order(:order => :asc)
		@ages = Age.all
		@groups = Group.all.order(:id => :asc)
		@schedules = Schedule.where("day > ?", DateTime.yesterday).order(:day => :asc)

		if @tag.category == "group"
			@group = Group.find_by(group: @tag.tag)
			@tag_users = @group.users_groups.map{|g| g.user.id}

		else @tag.category == "age"
			@age = Age.find_by(decade: @tag.tag)
			@tag_users = @age.users_ages.map{|a| a.user.id}
		end

		if admin_user_signed_in?
			@user = User.find_by(id: current_admin_user.id)
		end


	end



private
	def tag_params
		params.require(:user).permit(
			:name, :category, :tag, :name, :text
   		)
	end


end
