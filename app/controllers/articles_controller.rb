class ArticlesController < ApplicationController
  before_filter :load_article, only: :show
  authorize_resource only: :show

  def index
    @articles = project.articles
  end

  def show
  end

  private

  def project
    @project ||= Project.find(params[:project_id])
  end
  helper_method :project

  def load_article
    @article = project.articles.find(params[:id])
  end

  def current_ability
    @current_ability ||= Ability.new(current_user, params[:shared_key])
  end
end
