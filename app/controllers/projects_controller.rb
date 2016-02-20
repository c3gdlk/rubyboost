class ProjectsController < ApplicationController
  PER_PAGE = 2

  def index
    @projects = Project.recent.page(params[:page]).per(params[:per_page] || PER_PAGE)
  end
end
