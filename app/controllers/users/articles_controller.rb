class Users::ArticlesController < Users::BaseController
  def new
    @article = project.articles.build
  end

  def create
    @article = project.articles.build(permitted_params)

    if @article.save
      redirect_to project_articles_path(project)
    else
      render :new
    end
  end

  private

  def project
    @project ||= current_user.projects.find(params[:project_id])
  end
  helper_method :project

  def permitted_params
    params.require(:article).permit(:title, :content)
  end
end
