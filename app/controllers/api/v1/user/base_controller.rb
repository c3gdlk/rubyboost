class Api::V1::User::BaseController < Api::V1::BaseController
  before_filter :authenticate_user!

  private

  def authenticate_user!
    user = User.find_by(authentication_token: params[:auth_token])
    if user.present?
      sign_in user, store: false
    else
      raise NotAuthorized
    end
  end
end
