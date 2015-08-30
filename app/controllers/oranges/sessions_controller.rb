class Oranges::SessionsController < Devise::SessionsController
  include ApplicationHelper
  before_action :check_login, only: [:new, :create]

  def check_login
    if anyone_signed_in?
      redirect_to root_url, alert: 'Jau esat prisijungę!'
    end
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
