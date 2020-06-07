class TagsController < ApplicationController

before_action :set_tags


	def event
		@event = Event.find_by(ruby: params[:ruby])

		if @tag.category == "group"
			@users = User.where(id: @tag_users).or(User.where('grouping like?', "%#{@group.name}%")).event(@event.id).user_sort.page(params[:page])
		else @tag.category == "age"
			@users = User.where(id: @tag_users).or(User.where('average_age like?', "%#{@age.name}%")).event(@event.id).user_sort.page(params[:page])
		end


		# パンくず		
		@b1_name = @event.name
		@b1_url = "/#{@event.ruby}"
		@b2_name = @tag.name
		@b2_url = "/#{@event.ruby}/tag/#{@tag.id}"
	end

	def event_prefecture
		@event = Event.find_by(ruby: params[:ruby])
		@prefecture = Prefecture.find_by(kana: params[:kana])		

		# @user.groupingやaverage_ageのOR検索は未実装
		@users = 
		User.prefecture(@prefecture.id).or(User.prefecture_sub(@prefecture.id)).or(User.prefecture_50)
			.where(id: @tag_users).event(@event.id).user_sort.page(params[:page])

		# パンくず		
		@b1_name = @event.name
		@b1_url = "/#{@event.ruby}"
		@b2_name = @prefecture.name
		@b2_url = "/#{@event.ruby}/#{@prefecture.kana}"		
		@b3_name = @tag.name
		@b3_url = "/#{@event.ruby}/#{@prefecture.kana}/tag/#{@tag.id}"
	end


	def event_prefecture_city
		@event = Event.find_by(ruby: params[:ruby])
		@city = City.find_by(city_kana: params[:city_kana])	
		@prefecture =  Prefecture.find_by(id: @city.prefecture_id)	
		@prefecture_judge = Prefecture.find_by(kana: params[:kana])
		@city_users = @city.users_cities.map{|c| c.user.id}

		# @user.groupingやaverage_ageのOR検索は未実装
		@users = 
		User.city(@city_users).or(User.prefecture_50)
			.where(id: @tag_users).event(@event.id).user_sort.page(params[:page])

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
	end


	def prefecture
		@prefecture = Prefecture.find_by(kana: params[:kana])		

		# @user.groupingやaverage_ageのOR検索は未実装
		@users = 
		User.prefecture(@prefecture.id).or(User.prefecture_sub(@prefecture.id)).or(User.prefecture_50)
			.where(id: @tag_users).user_sort.page(params[:page])

		# パンくず		
		@b1_name = @prefecture.name
		@b1_url = "/prefectures/#{@prefecture.kana}"	
		@b2_name = @tag.name
		@b2_url = "/prefectures/#{@prefecture.kana}/tag/#{@tag.id}"	
	end


	def prefecture_city
		@city = City.find_by(city_kana: params[:city_kana])	
		@prefecture =  Prefecture.find_by(id: @city.prefecture_id)	
		@prefecture_judge = Prefecture.find_by(kana: params[:kana])
		@city_users = @city.users_cities.map{|c| c.user.id}

		# @user.groupingやaverage_ageのOR検索は未実装
		@users = 
		User.city(@city_users).or(User.prefecture_50)
			.where(id: @tag_users).user_sort.page(params[:page])

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
