class Unsubscribe::MembersController < Unsubscribe::ApplicationController
  before_action :authenticate_member!

  def show
    @member = current_member
  end

  def destroy
    @member = current_member

    if @member.destroy!
      flash[:notice] = "削除しました"
      redirect_to root_path
    else
      flash[:notice] = "削除に失敗しました"
      redirect_to root_path
    end

  end

end