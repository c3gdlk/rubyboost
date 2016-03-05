class ProjectsController < ApplicationController
  include SimpleResource

  resource_context :current_user
  paginate_collection 1

  private

  def after_save_redirect_path
    projects_path
  end

  def permitted_params
    params.require(:project).permit(:title, :picture)
  end
end
