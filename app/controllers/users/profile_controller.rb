class Users::ProfileController < Users::BaseController
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to users_projects_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
      profile_attributes: [:first_name, :last_name])
  end
end
