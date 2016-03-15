class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    comment = current_user.comments.build(permitted_params)
    comment.commentable = parent

    if comment.save
      flash[:success] = 'Comment was succesfully saved'
    else
      flash[:error] = 'Something goes wrong'
    end

    redirect_to :back
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    comment.destroy

    redirect_to :back
  end

  private

  def parent
    @parent ||=
      if params[:article_id].present?
        Article.find(params[:article_id])
      elsif params[:project_id].present?
        Project.find(params[:project_id])
      end
  end

  def permitted_params
    params.require(:comment).permit(:body)
  end
end
