class Users::BaseController < ApplicationController
  before_filter :authenticate_user!

  private

  def authenticate_user!
    unless user_signed_in?
      flash[:error] = 'Not Authorized'
      redirect_to root_path
    end
  end
end
