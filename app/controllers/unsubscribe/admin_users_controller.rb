class Unsubscribe::AdminUsersController < Unsubscribe::ApplicationController
  before_action :authenticate_admin_user!
  before_action :account_check

  def show
    @admin_user = current_admin_user
  end

  def destroy
    @admin_user = current_admin_user

    if @admin_user.destroy!
      flash[:notice] = "削除しました"
      redirect_to root_path
    else
      flash[:notice] = "削除に失敗しました"
      redirect_to root_path
    end

  end

  private
  def account_check
    if current_admin_user.check.present? && current_admin_user.check >= 1
      flash[:notice] = "権限がありません"
      redirect_to root_path
    end
  end

end