class BookmarksController < ApplicationController

	before_action :ensure_correct_member
  before_action :set_user, {only: [:create, :destroy]}

  def create
    @bookmark = @user.bookmarks.new(member_id: current_member.id)
    if @bookmark.save

    end
  end

  def destroy
    @bookmark = @user.bookmarks.find_by(member_id: current_member.id)
    if @bookmark.present?
        @bookmark.destroy

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
