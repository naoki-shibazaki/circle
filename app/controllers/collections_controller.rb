class CollectionsController < ApplicationController

before_action :ensure_correct_user
before_action :set_collections

	def index
		@collection = @user.collections.build	

		# パンくず
		@b2_name = "集金管理ページ"
		@b2_url = "/users/#{@user.id}/collections"			
	end

	def new
	end

	def create
		@user.collections.create(collection_params)

		if @user.save
			@collection = @user.collections.last

			flash[:notice] = "追加しました"
			redirect_to "/users/#{@user.id}/collections/#{@collection.id}"

		else
			flash[:notice] = "必須項目が未記入です"
			redirect_to user_collections_path
		end


	end

	def show
		@collection = Collection.find(params[:id])
		@item = @collection.items.build
		@items = @collection.items.order(:id => :asc)
		@sum_money = Item.where(collection_id: @collection.id).where(check: "check")

		# パンくず
		@b2_name = "集金管理ページ"
		@b2_url = "/users/#{@user.id}/collections"
		@b3_name = Time.parse(@collection.day).strftime("%-m月%-d日(#{%w(日 月 火 水 木 金 土)[Time.parse(@collection.day).wday]})")
		@b3_url = "/users/#{@user.id}/collections/#{@collection.id}"				
	end

	def edit
	end

	def update
		@collection = Collection.find(params[:id])

		if  @collection.update(collection_params)
			flash[:notice] = "金額を設定しました！"
			redirect_to user_collection_path(@user, @collection)

		else
			flash[:notice] = "エラー"
			redirect_to user_collection_path(@user, @collection)
		end

	end

	def destroy
	end


	private
		def collection_params
			params.require(:collection).permit(:day, :price)
		end

		def set_collections
			@user = User.find(params[:user_id])
			@collections = Collection.where(user_id: @user.id).where("day > ?", DateTime.yesterday).order(:day => :asc)	

			# パンくず
			@b1_name = @user.name
			@b1_url = "/users/#{@user.id}"
		end

		def ensure_correct_user
			@user = User.find(params[:user_id])

		   	if current_admin_user.id.to_i == @user.id.to_i	   		
			
		   	elsif current_admin_user.id == 1 

			else
			      flash[:notice] = "権限がありません"
			      redirect_to users_path
			end
		end	


end
