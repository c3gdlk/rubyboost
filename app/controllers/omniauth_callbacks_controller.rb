class OmniauthCallbacksController < ApplicationController

  def twitter
    process_callback
  end

  def facebook
    process_callback
  end

  private

  def process_callback
    oauth_data = request.env['omniauth.auth']

    unless user_signed_in?
      sign_in_with_oauth_data(oauth_data)
    end
    current_user.register_social_profile(oauth_data.provider, oauth_data.uid)

    redirect_to '/'
  end

  def sign_in_with_oauth_data(data)
    user =  User.find_or_create_with_oauth(data)
    sign_in :user, user
  end
end
