class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title
  delegate :current_user, to: :scope

  def url
    project_url(object)
  end

  def attributes
    data = super
    data.merge!(url: url) if current_user.present?

    data
  end
end
