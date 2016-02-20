class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user_signed_in?
    current_user.present?
  end
  helper_method :user_signed_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id].present?
  end
  helper_method :current_user
end
