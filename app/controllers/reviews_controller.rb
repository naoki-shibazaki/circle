class ReviewsController < ApplicationController

	before_action :set_user

	def index
		@review = @user.reviews.build

		@reviews = Review.where(user_id: @user.id)

		@b1_name = @user.name
		@b1_url = "/users/#{@user.id}"
		@b2_name = "口コミ・評価"
		@b2_url = ""
	end	

	def new
	end

	def create
		@user.reviews.create(review_params)

		if @user.save
			flash[:notice] = "投稿が完了しました！"
			redirect_to user_reviews_path

		else
			flash[:notice] = "必須項目が未記入です"
			redirect_to user_reviews_path
		end

	end

	def update
		@review = Review.find(params[:id])

		if @review.update(review_params)

			flash[:share] = '更新完了！'
			redirect_to user_reviews_path
		else
			render "edit"
		end	

	end

	def show
	end

	def edit
		@review = Review.find(params[:id])

		@b1_name = @user.name
		@b1_url = "/users/#{@user.id}"
		@b2_name = "活動スケジュール"
		@b2_url = "/users/#{@user.id}/schedules"
	end

	def destroy
	end


	def set_user
	    @user = User.find_by(id: params[:user_id])


	    if @user.present?  	
			if @user.switch.present?

			@b1_name = @user.event.name
			@b1_url = "/#{@user.event.ruby}"
			@b2_name = @user.prefecture.name
			@b2_url = "/#{@user.event.ruby}/#{@user.prefecture.kana}"	
			@b3_name = @user.name
			@b3_url = "/users/#{@user.id}"
					
			end
		end


    end    


    private
    def review_params
    	params.require(:review).permit(:review, :comment)
    end



end
