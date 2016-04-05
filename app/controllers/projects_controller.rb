class ProjectsController < ApplicationController
  include SimpleResource

  caches_action :index, cache_path: proc { |c| {user_id: c.current_user.id, only_path: true} }

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
