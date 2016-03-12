class Api::V1::AuthTokensController < Api::V1::BaseController

  def create
    auth_token = authenticate_by_email

    if auth_token.present?
      render json: {success: true, auth_token: auth_token}, status: 200
    else
      raise NotAuthorized
    end
  end

  private

  def authenticate_by_email
    user = User.find_by_email(params[:email])
    user.authentication_token if user.present? && user.valid_password?(params[:password])
  end
end
