# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
     unless @user.valid?
       render :new, status: :unprocessable_entity and return
     end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @user_profile = @user.build_user_profile
    render :new_user_profile, status: :accepted
  end

  def create_user_profile
    @user = User.new(session["devise.regist_data"]["user"])
    @user_profile = UserProfile.new(user_profile_params)
     unless @user_profile.valid?
       render :new_user_profile, status: :unprocessable_entity and return
     end
    @user.build_user_profile(@user_profile.attributes)
    binding.pry
    @user.save
    binding.pry
    session["devise.regist_data"]["user"].clear
    binding.pry
    sign_in(:user, @user)
    redirect_to root_path
  end
 
  private
 
  def user_profile_params
    params.require(:user_profile).permit( :family_name, :first_name, :family_name_kana,
                                          :first_name_kana, :birthday)
  end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

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
end
