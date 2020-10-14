class BookmarksController < ApplicationController

  # before_action :authenticate_member!
	before_action :ensure_correct_member
  before_action :set_user, {only: [:create, :destroy]}

  def create
    @bookmark = @user.bookmarks.new(member_id: current_member.id)
    if @bookmark.save
    	# flash[:notice] = "ブックマーク登録しました！"
      	# redirect_to request.referer
    # else
      # redirect_to request.referer
    end
  end

  def destroy
    @bookmark = @user.bookmarks.find_by(member_id: current_member.id)
    if @bookmark.present?
        @bookmark.destroy
        # flash[:notice] = "ブックマーク解除しました！"
        # redirect_to request.referer
    # else
        # redirect_to request.referer
    end
  end


private
	def ensure_correct_member

		if member_signed_in?

		else

	      redirect_to new_member_registration_path

		end
	end  

  def set_user
    @user = User.find(params[:user_id])
  end



end
