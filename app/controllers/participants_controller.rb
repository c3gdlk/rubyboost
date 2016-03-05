class ParticipantsController < ApplicationController

  def index
    @users = project.participants.includes(:profile)
  end 

  private

  def project
    @project ||= Project.find(params[:project_id])
  end
  helper_method :project
end
