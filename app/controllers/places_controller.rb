class PlacesController < ApplicationController

	before_action :correct_user, {only: [:new, :count]}
	before_action :ensure_correct_user, {only: [:edit, :update]}
	before_action :set_place


	def index	
		redirect_to "/places/basketball"
	end	


	def new
		@place = Place.new
		@place_button = "登録する"
	end

	def create
		@place = Place.new(place_params)
		@place.user_id = @current_user.id
		@place.save

		@prefecture = Prefecture.find_by(id: @place.prefecture_id)
		@city = City.find_by(id: @place.city_id)

		if @place.update(place_params)
			
			flash[:notice] = '登録完了！'
			redirect_to "/places/all/#{@prefecture.kana}/#{@city.city_kana}/#{@place.id}"
		else
			render "/places/edit"
		end	

	end

	def show
		@place = Place.find(params[:id])

		@event = Event.find_by(ruby: params[:ruby])
		@prefecture = Prefecture.find_by(kana: params[:kana])		
		@city = City.find_by(city_kana: params[:city_kana])	

	    @places = Place.where(event_id: @event.id).where(prefecture_id: @prefecture.id).where(city_id: @city.id)
	    @users = User.where(event_id: @event.id, prefecture_id: @prefecture.id, switch: "募集中").order(switch: :asc, last_post: :desc)
		
		@place_events = @place.places_events.map{|e| e.event}

		@place_events.each do |event|
			if event.id == @event.id
				@place_event_id = event.id
			end
		end

		if @event.id.to_i != @place_event_id.to_i || @prefecture.id.to_i != @place.prefecture_id.to_i || @city.id.to_i != @place.city_id.to_i
			flash[:notice] = 'URLが間違っています'
			redirect_to "/places"
		end

		@b2_name = @event.name
		@b2_url = "/places/#{@event.ruby}"	
		@b3_name = @prefecture.name
		@b3_url = "/places/#{@event.ruby}/#{@prefecture.kana}"
		@b4_name = @city.name
		@b4_url = "/places/#{@event.ruby}/#{@prefecture.kana}/#{@city.city_kana}"
		@b5_name = @place.name
		@b5_url = "/places/#{@event.ruby}/#{@prefecture.kana}/#{@city.city_kana}/#{@place.name}"
	end

	def show_noindex
		@place = Place.find(params[:id])

		@prefecture = Prefecture.find_by(kana: params[:kana])		
		@city = City.find_by(city_kana: params[:city_kana])	
		
		@place_events = @place.places_events.map{|e| e.event}
	end	


	def edit
		@place = Place.find(params[:id])
		@place_button = "更新する"
	end

	def update
		@place = Place.find(params[:id])

		@prefecture = Prefecture.find_by(id: @place.prefecture_id)
		@city = City.find_by(id: @place.city_id)		

		if @place.update(place_params)
			flash[:notice] = '更新完了！'
			redirect_to "/places/all/#{@prefecture.kana}/#{@city.city_kana}/#{@place.id}"
		else
			render "/places/edit"
		end	
	end

	def destroy
	    @place = Place.find_by(id: params[:id])
   		@place.destroy		

		redirect_to "/places"
	end

	def count
	 	@places = Place.group(:user_id).count(:user_id)
	end		


	def event
		@event = Event.find_by(ruby: params[:ruby])

		@event_places = @event.places_events.map{|p| p.place.id}
	    @places = Place.where(id: @event_places).order(updated_at: "DESC").page(params[:page])
	    @places_count = Place.where(event_id: @event.id)

		@b2_name = @event.name
		@b2_url = "/places/#{@event.ruby}"	
	end	

	def prefecture
		@event = Event.find_by(ruby: params[:ruby])
		@prefecture = Prefecture.find_by(kana: params[:kana])
		@cities = City.where(prefecture_id: @prefecture.id).order(:id => :asc)

		@event_places = @event.places_events.map{|p| p.place.id}
	    @places = Place.where(id: @event_places).where(prefecture_id: @prefecture.id).all.order(updated_at: "DESC").page(params[:page])
	    @places_count = Place.where(event_id: @event.id).where(prefecture_id: @prefecture.id)

		@b2_name = @event.name
		@b2_url = "/places/#{@event.ruby}"	
		@b3_name = @prefecture.name
		@b3_url = "/places/#{@event.ruby}/#{@prefecture.kana}"
	end	

	def city
		@event = Event.find_by(ruby: params[:ruby])
		@prefecture = Prefecture.find_by(kana: params[:kana])		
		@city = City.find_by(city_kana: params[:city_kana])

		@event_places = @event.places_events.map{|p| p.place.id}
	    @places = Place.where(id: @event_places).where(prefecture_id: @prefecture.id).where(city_id: @city.id).all.order(updated_at: "DESC").page(params[:page])
	    @places_count = Place.where(event_id: @event.id).where(prefecture_id: @prefecture.id).where(city_id: @city.id)
	    
		@b2_name = @event.name
		@b2_url = "/places/#{@event.ruby}"	
		@b3_name = @prefecture.name
		@b3_url = "/places/#{@event.ruby}/#{@prefecture.kana}"
		@b4_name = @city.name
		@b4_url = "/places/#{@event.ruby}/#{@prefecture.kana}/#{@city.city_kana}"
	end	

	def correct_user
	    if admin_user_signed_in?

	    else
	        flash[:notice] = "権限がありません"
	        redirect_to places_path      
	    end

    end

	def ensure_correct_user
		@place = Place.find(params[:id])
		@user = User.find_by(id: @place.user_id)
		
	   if current_admin_user.id != @user.admin_user_id.to_i
	   		if current_admin_user.id == 1   			
	   		
		   	else
		      flash[:notice] = "権限がありません"
		      redirect_to places_path

		    end
	   end
	end	 


    def set_place
    	@places = Place.all.order(updated_at: "DESC").page(params[:page])
		@events = Event.all
		@prefectures = Prefecture.where.not(id: 50).order(:order => :asc)
		@cities = City.all.order(:id => :asc)
		@count = "nil"
		@id = 1

    	@b1_name = "コート情報"
		@b1_url = "/places"

	    if admin_user_signed_in?
	      @current_user = User.find_by(admin_user_id: current_admin_user.id)
	    end

    end

	private
	def place_params
		params.require(:place).permit(
			:user_id,
			:prefecture_id,
			:city_id,
			:event_id,
			:name,
			:address,
			:access,
			:parking,
			:time,
			:regular_holiday,
			:scale,
			:price,
			:tel,
			:url,
			:tag,
			:sns,
			:img_link,
			:img_url,
			:img_source,
			event_ids:[]
		)
	end


end
