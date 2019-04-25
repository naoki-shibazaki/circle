class PrefecturesController < ApplicationController

	before_action :set_prefecture

	def camera
		@item = "写真・カメラ"
		@users = User.all.order(updated_at: "DESC").where(prefecture_id: @prefecture.id).where(item: @item).page(params[:page]).per(10)
	end

	def basketball
		@item = "バスケットボール"
		@users = User.all.order(updated_at: "DESC").where(prefecture_id: @prefecture.id).where(item: @item).page(params[:page]).per(10)
	end


	def camera_top
		@item = "写真・カメラ"
		@kana = "camera"
		@users = User.where(item: @item)		
	end

	def basketball_top
		@item = "バスケットボール"
		@kana = "basketball"
		@users = User.where(item: @item)		
	end

	def prefecture_top
		@users = User.all.order(updated_at: "DESC").where(prefecture_id: @prefecture.id).page(params[:page]).per(10)
	end

	def set_prefecture
		@prefecture = Prefecture.all.order(updated_at: "DESC").find_by(kana: params[:kana])
		@prefectures = Prefecture.all.order(updated_at: "DESC").where.not(kana: "nil")
		@x = "nil"
	end



end
