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
    @place_review.ip_address = request.remote_ip

    # レビュースコア平均
    sum_facility = @place.place_reviews.sum(:facility)
    sum_price = @place.place_reviews.sum(:price)
    sum_access = @place.place_reviews.sum(:access)
    sum_reservation = @place.place_reviews.sum(:reservation)
    count_reviews = @place.place_reviews.count

    @place.average_facility =  (sum_facility / count_reviews.to_f)
    @place.average_price =  (sum_price / count_reviews.to_f)
    @place.average_access =  (sum_access / count_reviews.to_f)
    @place.average_reservation =  (sum_reservation / count_reviews.to_f)
    @place.average_score = (sum_facility + sum_price + sum_access + sum_reservation)/(count_reviews * 4)
    @place.save


    if @place_review.save
      flash[:notice] = "投稿ありがとうございます！"
      redirect_back(fallback_location: root_path)

    else
      flash[:notice] = "必須項目をご記入ください"
      redirect_back(fallback_location: root_path)
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
