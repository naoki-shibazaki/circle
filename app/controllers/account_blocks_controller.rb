class AccountBlocksController < ApplicationController
  before_action :webmaster

  def index
    @account_blocks = AccountBlock.all.order(created_at: "DESC")
  end

  def destroy
		@account_block = AccountBlock.find(params[:id])
		@account_block.destroy

		flash[:notice] = "削除しました"
		redirect_to account_blocks_path
  end


  private
	def webmaster
    if current_admin_user.id == 1

    else
      flash[:notice] = "権限がありません"
      redirect_to users_path
    end

  end


end
