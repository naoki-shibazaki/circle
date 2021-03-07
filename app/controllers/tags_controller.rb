class TagsController < ApplicationController
include ApplicationHelper

before_action :set_tags

def index

  if @tag.category == "group"
    @users = User.user(@tag_users).or(User.grouping(@group.name)).user_sort.page(params[:page])
  else @tag.category == "age"
    @users = User.user(@tag_users).or(User.average_age(@age.name)).user_sort.page(params[:page])
  end

  # パンくず
  @b1_name = @tag.name
  @b1_url = "tag/#{@tag.id}"

  # amp対応
  amp_set
end

	def event
		@event = Event.find_by(ruby: params[:ruby])

		if @tag.category == "group"
			@users = User.user(@tag_users).or(User.grouping(@group.name)).event(@event.id).user_sort.page(params[:page])
		else @tag.category == "age"
			@users = User.user(@tag_users).or(User.average_age(@age.name)).event(@event.id).user_sort.page(params[:page])
		end

		# パンくず
		@b1_name = @event.name
		@b1_url = "/#{@event.ruby}"
		@b2_name = @tag.name
    @b2_url = "/#{@event.ruby}/tag/#{@tag.id}"

    # amp対応
    amp_set
	end

	def event_prefecture
		@event = Event.find_by(ruby: params[:ruby])
		@prefecture = Prefecture.find_by(kana: params[:kana])

		if @tag.category == "group"
			@users = User.prefecture(@prefecture.id).or(User.prefecture_sub(@prefecture.id)).or(User.prefecture_50)
				.grouping(@group.name).event(@event.id).user_sort.page(params[:page])
		else @tag.category == "age"
			@users = User.prefecture(@prefecture.id).or(User.prefecture_sub(@prefecture.id)).or(User.prefecture_50)
				.average_age(@age.name).event(@event.id).user_sort.page(params[:page])
		end

		# パンくず
		@b1_name = @event.name
		@b1_url = "/#{@event.ruby}"
		@b2_name = @prefecture.name
		@b2_url = "/#{@event.ruby}/#{@prefecture.kana}"
		@b3_name = @tag.name
    @b3_url = "/#{@event.ruby}/#{@prefecture.kana}/tag/#{@tag.id}"

    # amp対応
    amp_set
	end


	def event_prefecture_city
		@event = Event.find_by(ruby: params[:ruby])
		@city = City.find_by(city_kana: params[:city_kana])
		@prefecture =  Prefecture.find_by(id: @city.prefecture_id)
		@prefecture_judge = Prefecture.find_by(kana: params[:kana])
		@city_users = @city.users_cities.map{|c| c.user.id}

		if @tag.category == "group"
			@users = User.city(@city_users).or(User.prefecture_50)
				.grouping(@group.name).event(@event.id).user_sort.page(params[:page])
		else @tag.category == "age"
			@users = User.city(@city_users).or(User.prefecture_50)
				.average_age(@age.name).event(@event.id).user_sort.page(params[:page])
		end

		# @user.groupingやaverage_ageのOR検索は未実装
		@users = User.city(@city_users).or(User.prefecture_50)
			.user(@tag_users).event(@event.id).user_sort.page(params[:page])

		if @tag.category == "group"
			@users = User.city(@city_users).or(User.prefecture_50)
				.grouping(@group.name).event(@event.id).user_sort.page(params[:page])
		else @tag.category == "age"
			@users = User.city(@city_users).or(User.prefecture_50)
				.average_age(@age.name).event(@event.id).user_sort.page(params[:page])
		end

		if @city.prefecture_id.to_i != @prefecture_judge.id.to_i
      flash[:notice] = "URLが間違っています"
      redirect_to users_path
		end

		# パンくず
		@b1_name = @event.name
		@b1_url = "/#{@event.ruby}"
		@b2_name = @prefecture.name
		@b2_url = "/#{@event.ruby}/#{@prefecture.kana}"
		@b3_name = @city.name
		@b3_url = "/#{@event.ruby}/#{@prefecture.kana}/#{@city.city_kana}"
		@b4_name = @tag.name
    @b4_url = "/#{@event.ruby}/#{@prefecture.kana}/#{@city.city_kana}/tag/#{@tag.id}"

    # amp対応
    amp_set
	end


	def prefecture
		@prefecture = Prefecture.find_by(kana: params[:kana])

		if @tag.category == "group"
			@users = User.prefecture(@prefecture.id).or(User.prefecture_sub(@prefecture.id)).or(User.prefecture_50)
				.grouping(@group.name).user_sort.page(params[:page])
		else @tag.category == "age"
			@users = User.prefecture(@prefecture.id).or(User.prefecture_sub(@prefecture.id)).or(User.prefecture_50)
				.average_age(@age.name).user_sort.page(params[:page])
		end

		# パンくず
		@b1_name = @prefecture.name
		@b1_url = "/prefectures/#{@prefecture.kana}"
		@b2_name = @tag.name
    @b2_url = "/prefectures/#{@prefecture.kana}/tag/#{@tag.id}"

    # amp対応
    amp_set
	end


	def prefecture_city
		@city = City.find_by(city_kana: params[:city_kana])
		@prefecture =  Prefecture.find_by(id: @city.prefecture_id)
		@prefecture_judge = Prefecture.find_by(kana: params[:kana])
		@city_users = @city.users_cities.map{|c| c.user.id}

		if @tag.category == "group"
			@users = User.city(@city_users).or(User.prefecture_50)
				.grouping(@group.name).user_sort.page(params[:page])
		else @tag.category == "age"
			@users = User.city(@city_users).or(User.prefecture_50)
				.average_age(@age.name).user_sort.page(params[:page])
		end

		if @city.prefecture_id.to_i != @prefecture_judge.id.to_i
      flash[:notice] = "URLが間違っています"
      redirect_to users_path
		end

		# パンくず
		@b1_name = @prefecture.name
		@b1_url = "/prefectures/#{@prefecture.kana}"
		@b2_name = @city.name
		@b2_url = "/prefectures/#{@prefecture.kana}/#{@city.city_kana}"
		@b3_name = @tag.name
    @b3_url = "/prefectures/#{@prefecture.kana}/#{@city.city_kana}/tag/#{@tag.id}"

    # amp対応
    amp_set
	end


private
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


	def tag_params
		params.require(:user).permit(
			:name, :category, :tag, :name, :text
    )
	end


end
