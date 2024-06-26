# frozen_string_literal: true

class AdminUsers::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   # super
  #   @admin_user = AdminUser.new
  #   @user = User.new
  #   @user.id = @admin_user.id
  #   @user.save
  # end

  # POST /resource
  # def create
  # super
    # @user = User.new
    # @user.id = resource.id
    # @user.last_post = Time.now.ago(3.days)
    # @user.user_time = Time.now
    # @user.save
  # end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
  super
    @data = AdminUser.find_by(id: current_admin_user.id)

    # if @data.valid_password?(params[:current_password])

    #     if @data.update(data_params)
    #     else
    #       render "/admin_users/edit"
    #     end

    # else
    #     render "/admin_users/edit"
    # end

  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

private
  def data_params
    params.require(:admin_user).permit( :email )
  end

  def admin_user_params
    params.require(:admin_user).permit(:password, :email, :current_sign_in_at)
  end


end

