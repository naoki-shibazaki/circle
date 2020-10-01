class ReviewsController < ApplicationController

	before_action :ensure_correct_member, {only: [:edit, :update]}
	before_action :set_member

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
		@review = @user.reviews.last
		@review.member_id = @member.id

		if @review.save
			
			# レビュー高評価
			if @review.review = 1
				@user.last_post = Time.now
				@user.save
			else				
			end


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

			flash[:notice] = "編集が完了しました！"
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
		@b2_name = "口コミ・評価"
		@b2_url = "/users/#{@user.id}/schedules"
	end

	def destroy
		@review = Review.find(params[:id])
		@review.destroy

		flash[:notice] = "削除しました"
		redirect_to user_reviews_path
	end


	def set_member
	    @user = User.find_by(id: params[:user_id])
	    @prefectures = Prefecture.all

		if member_signed_in?
			@member = current_member
			@member_reviews = Review.where(user_id: @user.id, member_id: @member.id)
		end

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

		# レビュー合計値
		@star_sum = @user.reviews.sum{|review| review[:review]}
		# レビュー数
		@star_count = @user.reviews.count
		# レビュー値
		if @star_count == 0 && @star_sum == 0
			@star_review =  0
		else
			@star_review =  (@star_sum / @star_count.to_f)*5
		end

    end    


    private
    def review_params
    	params.require(:review).permit(:review, :comment)
    end

	def ensure_correct_member
		@review = Review.find(params[:id])		

		if member_signed_in?
		   	if current_member.id.to_i == @review.member_id.to_i
			# OK
			else
			      flash[:notice] = "権限がありません"
			      redirect_to user_reviews_path
			end
		end

		if admin_user_signed_in?
	   		if current_admin_user.id == 1
 			# OK
	   		else
		      flash[:notice] = "権限がありません"
		      redirect_to user_reviews_path	  
	   		end
		end
	end	


end
