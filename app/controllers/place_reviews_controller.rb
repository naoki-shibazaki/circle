class PlaceReviewsController < ApplicationController
	before_action :set_place

	def index
	end

	def new
	end

	def create
		@place.place_reviews.create(place_review_params)
		@place_review = @place.place_reviews.last
    @place_review.average_score = (@place_review.facility + @place_review.reservation + @place_review.price + @place_review.access)/4

    if @place_review.save
      flash[:notice] = "保存完了"
      redirect_back(fallback_location: root_path)

    else
      flash[:notice] = "失敗！"
    end
	end

	def update
	end

	def edit
	end

	def destroy
	end


  private
	def place_review_params
		params.require(:place_review).permit(
      :facility,
      :reservation,
      :price,
      :access,
      :average_score,
      :event_id,
      :ip_address,
      :comment
		)
	end

	def set_place
    @place = Place.find(params[:place_id])
  end


end
