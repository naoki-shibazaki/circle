class AdminUsersController < ApplicationController


    private
    def admin_user_params
      params.require(:admin_user).permit(:id, :email, :nickname, :image_profile, :gender, :profile, :check)
    end

end
