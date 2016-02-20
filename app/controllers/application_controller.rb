class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :choose_layout

  private

  def choose_layout
    devise_controller? ? 'application' : 'application'
  end
end
