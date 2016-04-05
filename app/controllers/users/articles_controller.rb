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

  def edit
    @comment_for_reject = Comment.new
  end

  def update
    if article.update(permitted_params)
      redirect_to project_articles_path(project)
    else
      render :new
    end
  end

  def send_for_moderation
    article.send_for_moderation!
    redirect_to edit_users_project_article_path(project, article)
  end

  def approve
    article.approve!
    redirect_to edit_users_project_article_path(project, article)
  end

  def reject
    result = Articles::Reject.perform(article, current_user, reject_params[:body])

    if result.success?
      redirect_to edit_users_project_article_path(project, article)
    else
      @comment_for_reject = result.comment_for_reject

      render :edit
    end
  end

  private

  def article
    @article ||= project.articles.find(params[:article_id] || params[:id])
  end
  helper_method :article

  def project
    @project ||= current_user.projects.find(params[:project_id])
  end
  helper_method :project

  def permitted_params
    params.require(:article).permit(:title, :content)
  end

  def reject_params
    params.require(:comment).permit(:body)
  end
end
