class SuperAdmin::CirclesController < ApplicationController
  before_action :authenticate_admin_user!
  before_action :require_super_admin

  def index
    @admin_users = AdminUser.order(created_at: :desc).includes(:users)
  end

  def destroy
    @admin_user = AdminUser.find(params[:id])
    @admin_user.destroy
    flash[:notice] = "削除しました"
    redirect_to super_admin_circles_path
  end

  private

  def require_super_admin
    unless current_admin_user.id == 1
      flash[:notice] = "権限がありません"
      redirect_to root_path
    end
  end
end
