class Api::V1::ProjectsController < Api::V1::BaseController
  def index
    projects = Project.all
    respond_with_success projects
  end
end
