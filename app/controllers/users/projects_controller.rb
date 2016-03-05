class Users::ProjectsController < Users::BaseController
  PER_PAGE = 2

  before_action :find_project, only: [:edit, :update, :destroy]

  def index
    @projects = current_user.authored_projects.recent.page(params[:page]).per(params[:per_page] || PER_PAGE)
  end

  def new
    @project = current_user.authored_projects.build
  end

  def create
    @project = current_user.authored_projects.build(project_params)

    if @project.save
      redirect_to users_projects_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to users_projects_path
    else
      render :edit
    end
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
