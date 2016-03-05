class ProjectUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates :project_id, uniqueness: { scope: :user_id }
end
