class DifferencesController < ApplicationController

before_action :set_difference



	  def index
	  end 

	  def new
	  	@difference = Difference.new
	  end   

	  def create
		@difference = Difference.new(difference_params)


		# 計算
			@order_first = @difference.order.to_i - 1
			@order_second = 308 - @difference.order.to_i

			@difference.combine = ""
			(0...@order_first.to_i).each do
			  @difference.combine << @difference.letter
			end

			@difference.combine = @difference.combine + @difference.dummy

			(0...@order_second.to_i).each do
			  @difference.combine << @difference.letter
			end


		@difference.save

		if @difference.update(difference_params)
			
			flash[:share] = '間違い探しを作成しました！'
			redirect_to difference_path(@difference.id)
		else
			render "/differences/edit"
		end		  	
	  end 



	  def update
	  end  

	  def edit
	  	@difference = Difference.find(params[:id])	  	
	  end 

	  def show
	  	@difference = Difference.find(params[:id])

	  	@difference_new = Difference.new


		# パンくず    	
		@b3_name = "「#{@difference.dummy}」を見つけられたら天才"
		@b3_url = ""	  	
	  end 

 

	  def destroy
	  end   

	  def contents
	  end  


    def set_difference
    	@differences = Difference.all.order(created_at: "DESC").page(params[:page])

		# パンくず    	
		@b1_name = "コンテンツ"
		@b1_url = "/contents"
		@b2_name = "間違い探しメーカー"
		@b2_url = "/contents/differences"	
    end

    private
    def difference_params
    	params.require(:difference).permit(:letter, :dummy, :order, :combine)
    end


end
