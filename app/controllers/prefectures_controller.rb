class PrefecturesController < ApplicationController

	before_action :set_prefecture

	def camera
		@item = "写真・カメラ"
		@users = User.where(prefecture_id: @prefecture.id).where(item: @item)
	end

	def basketball
		@item = "バスケットボール"
		@users = User.where(prefecture_id: @prefecture.id).where(item: @item)
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

	def set_prefecture
		@prefecture = Prefecture.find_by(kana: params[:kana])
		@prefectures = Prefecture.where.not(kana: "nil")
		@x = "nil"
	end



end
