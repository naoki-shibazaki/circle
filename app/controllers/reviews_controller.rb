class ReviewsController < ApplicationController

  include Circlebook

	before_action :ensure_correct_member, {only: [:edit, :update]}
	before_action :set_member, {except: [:all_reviews]}

	def index
		@review = @user.reviews.build
		@reviews = Review.where(user_id: @user.id).order(created_at: :DESC)
    @ip = Review.where(user_id: @user.id, ip: request.remote_ip)
		@b4_name = "口コミ・評価"
		@b4_url = ""
	end

	def new
	end

	def create
		@user.reviews.create(review_params)
		@review = @user.reviews.last
    if InvalidEmail.find_by(email: @user.admin_user.email)
      @invalid = "無効"
    else
      @invalid = "有効"
    end

    if member_signed_in?
      @review.member_id = @member.id
    else
      @review.ip = request.remote_ip
    end

		# レビュースコア
		star_sum = @user.reviews.sum{|review| review[:review]}
		star_count = @user.reviews.count
		if star_count == 0 && star_sum == 0
			@user.review_score =  0
      cb_point(@user)
      @user.save
		else
			@user.review_score =  (star_sum / star_count.to_f)*5
      cb_point(@user)
      @user.save
		end

		if @review.save
			# レビュー高評価

      if @review.review == 1 && @user.switch == "募集中" && @invalid == "有効"
				@user.last_post = Time.zone.now
				@user.save
				ReviewMailer.send_review(@user).deliver

      # 主催者に通知なし
      elsif @review.review == 1

      elsif @review.review == 0
				ReviewMailer.bad_review(@user).deliver
      else
			end
			flash[:notice] = "投稿が完了しました！"
			redirect_to user_reviews_path

		else

			flash[:notice] = "6文字未満かNGワードが含まれています"
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

	def edit
		@review = Review.find(params[:id])
	end

	def destroy
		@review = Review.find(params[:id])
		@review.destroy

		# レビュースコア
		star_sum = @user.reviews.sum{|review| review[:review]}
		star_count = @user.reviews.count
		if star_count == 0 && star_sum == 0
			@user.review_score =  0
      cb_point(@user)
      @user.save
		else
			@user.review_score =  (star_sum / star_count.to_f)*5
      cb_point(@user)
      @user.save
		end

		flash[:notice] = "削除しました"
		redirect_to user_reviews_path
	end

  def all_reviews
    @reviews = Review.all.order(updated_at: "ASC")

    @b1_name = "サークルブック内の口コミ・評価"
    @b1_url = ""
  end


  private
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
  end


  def review_params
    params.require(:review).permit(:review, :comment, :ip, :age, :gender, :nickname)
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
