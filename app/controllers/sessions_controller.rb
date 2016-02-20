class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])

    if user.present? && user.valid_password?(params[:password])
      session[:user_id] = user.id
      flash[:success] = 'Login succesful'
    else
      flash[:error] = 'Login failured'
    end

    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil

    redirect_to root_path
  end
end
