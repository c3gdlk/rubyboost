class User < ActiveRecord::Base
  include Omniauthable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :twitter]

  has_one  :profile
  has_many :authored_projects, class_name: 'Project', foreign_key: :user_id
  has_many :social_profiles
  has_many :project_users
  has_many :participated_projects, through: :project_users, source: :project

  after_create :create_user_profile

  accepts_nested_attributes_for :profile

  delegate :first_name, :last_name, to: :profile, allow_nil: true

  def participate_in?(project)
    project_users.exists?(project_id: project.id)
  end

  private

  def create_user_profile
    build_profile
    profile.save(validates: false)
  end
end
