class Api::V1::BaseController < ActionController::Base
  respond_to :json

  serialization_scope :view_context

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: :respond_with_internal_error

    rescue_from CanCan::AccessDenied, NotAuthorized, with: :respond_with_not_authorized

    rescue_from ActiveRecord::RecordNotFound,
                ActionController::RoutingError,
                ActiveRecord::RecordInvalid,
                with: :respond_with_not_found

  end

  private

  def respond_with_success(data, status=200)
    render json: data, status: status, root: false
  end

  def respond_with_error(object, status=422)
    render json: {success: false, errors: object.errors, errors_messages: object.errors.full_messages}, status: status
  end

  def respond_with_not_found
    render json: {success: false, message: 'Cant found record'}, status: 404
  end

  def respond_with_internal_error(exception)
    response = {success: false, message: 'Internal error'}
    response.merge!(debug: exception.message) unless Rails.env.production?

    render json: response, status: 500
  end

  def respond_with_not_authorized
    render json: {success: false, message: 'Not Authorized'}, status: 401
  end
end
