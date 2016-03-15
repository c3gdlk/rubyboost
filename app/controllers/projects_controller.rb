class ProjectsController < ApplicationController
  include SimpleResource

  paginate_collection 10

  def index
    index! do |format|
      format.html { render :index }
      format.json { render json: collection }
    end
  end

  private


  def permitted_params
    params.require(:project).permit(:title, :picture)
  end
end
