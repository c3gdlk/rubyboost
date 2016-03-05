class Ability
  include CanCan::Ability

  def initialize(user, shared_key=nil)
    user ||= User.new # guest user (not logged in)

    can :read, Article do |article|
      shared_key.present? && article.shared_key == shared_key
    end

    can [:read, :create, :update], Article do |article|
      article.project.project_users.exists?(user_id: user.id)
    end

    can :manage, Article do |article|
      article.project.user == user
    end
  end
end
