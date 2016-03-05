class ApplicationController < ActionController::Base
  respond_to :html, :js
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: :redirect_with_error

    rescue_from CanCan::AccessDenied, with: :not_autorized

    rescue_from ActiveRecord::RecordNotFound,
                ActionController::RoutingError,
                ActiveRecord::RecordInvalid,
                with: :redirect_with_error

  end

  layout :choose_layout

  private

  def choose_layout
    devise_controller? ? 'application' : 'application'
  end

  def redirect_with_error
    flash[:error] = 'Something goes wrong'
    redirect_to root_path
  end

  def not_autorized
    flash[:error] = 'You not authorized to perform this action'
    redirect_to root_path
  end
end
