class Users::ProjectsController < Users::BaseController
  PER_PAGE = 10

  before_action :find_project, only: [:edit, :update, :destroy]

  def index
    @projects = current_user.authored_projects.recent.page(params[:page]).per(params[:per_page] || PER_PAGE)
  end

  def new
    @project = current_user.authored_projects.build
  end

  def create
    @project = current_user.authored_projects.create(project_params)
    respond_with @project, location: users_projects_path
  end

  def edit
  end

  def update
    @project.update(project_params)
    respond_with @project, location: users_projects_path
  end

  def destroy
    @project.destroy

    redirect_to users_projects_path
  end

  private

  def find_project
    @project = current_user.authored_projects.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :picture)
  end
end
