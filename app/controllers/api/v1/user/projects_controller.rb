class Api::V1::User::ProjectsController < Api::V1::User::BaseController
  def index
    projects = current_user.projects
    respond_with_success projects
  end
end
