class PlacesController < ApplicationController

	before_action :correct_user, {only: :new}
	before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
	before_action :set_place


	def index	

	end	


	def new
		@place = Place.new
		@place_button = "投稿する"
	end

	def create
		@place = Place.new(place_params)
		@place.user_id = @current_user.id
		@place.save

		@event = Event.find_by(id: @place.event_id)
		@prefecture = Prefecture.find_by(id: @place.prefecture_id)
		@city = City.find_by(id: @place.city_id)

		if @place.update(place_params)
			
			flash[:share] = '投稿完了！'
			# redirect_to place_path(@place.id)
			redirect_to "/places/#{@event.ruby}/#{@prefecture.kana}/#{@city.city_kana}/#{@place.id}"
		else
			render "/places/edit"
		end	

	end

	def show
		@place = Place.find(params[:id])

		@event = Event.find_by(ruby: params[:ruby])
		@prefecture = Prefecture.find_by(kana: params[:kana])		
		@city = City.find_by(city_kana: params[:city_kana])		

		if @event.id.to_i != @place.event_id.to_i || @prefecture.id.to_i != @place.prefecture_id.to_i || @city.id.to_i != @place.city_id.to_i
			redirect_to "/places"
		end

		@b1_name = "施設一覧"
		@b1_url = "/places"
		# @b2_name = @user.prefecture.name
		# @b2_url = "/#{@user.event.ruby}/#{@user.prefecture.kana}"	
		# @b3_name = @user.name.truncate(8)
		# @b3_url = ""

	end


	def edit
		@place = Place.find(params[:id])
		@place_button = "編集する"
	end

	def update
		@place = Place.find(params[:id])

		@event = Event.find_by(id: @place.event_id)
		@prefecture = Prefecture.find_by(id: @place.prefecture_id)
		@city = City.find_by(id: @place.city_id)		

		if @place.update(place_params)
			flash[:share] = '更新完了！'
			redirect_to "/places/#{@event.ruby}/#{@prefecture.kana}/#{@city.city_kana}/#{@place.id}"
		else
			render "/places/edit"
		end	
	end

	def destroy
	    @place = Place.find_by(id: params[:id])
   		@place.destroy		

		redirect_to "/places"
	end


	private
	def correct_user
	    if admin_user_signed_in?

	    else
	        flash[:notice] = "権限がありません"
	        redirect_to places_path      
	    end

    end

	def ensure_correct_user
		@place = Place.find(params[:id])
		
	   if current_admin_user.id != @place.user_id.to_i
	   		if current_admin_user.id == 1   			
	   		
		   	else
		      flash[:notice] = "権限がありません"
		      redirect_to places_path

		    end
	   end
	end	 


    def set_place
    	@places = Place.all

	    if admin_user_signed_in?
	      @current_user = User.find_by(id: current_admin_user.id)
	    end
    end

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
			:sns
		)
	end


end
