class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :signed_in?, :signed_in_model, :signed_in_id

  include ApplicationHelper



  protected

  def signed_in_model
    return 'Maker' if maker_signed_in?
    return 'User'  if user_signed_in?
    return nil
  end

  def signed_in_id
    return current_maker.id if maker_signed_in?
    return current_user.id  if user_signed_in?
    return nil
  end

  def signed_in?
    user_signed_in? || maker_signed_in?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up)        { |u| u.permit(:nickname, :first_name, :last_name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:nickname, :first_name, :last_name, :email, :password, :password_confirmation, :current_password) }
  end
end
