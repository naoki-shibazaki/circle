class ReviewsController < ApplicationController

	before_action :set_user

	def index
	end	

	def new
	end

	def create
	end

	def update
	end

	def show
	end

	def edit
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
