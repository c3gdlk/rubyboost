class ProjectSubscriptionsController < ApplicationController
  before_filter :authenticate_user!

  def create
    project.participants << current_user
  end

  def destroy
    project.project_users.where(user_id: current_user).first.destroy
  end

  private

  def project
    @project ||= Project.find(params[:project_id])
  end
  helper_method :project
end
