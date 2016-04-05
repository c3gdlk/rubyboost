class User < ActiveRecord::Base
  include Omniauthable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :twitter]

  has_one  :profile
  has_many :projects
  has_many :comments
  has_many :authored_projects, class_name: 'Project', foreign_key: :user_id
  has_many :social_profiles
  has_many :project_users
  has_many :participated_projects, through: :project_users, source: :project
  has_many :activities_for_me,  class_name: 'Activity', foreign_key: :recipient_id
  has_many :activities_from_me, class_name: 'Activity', foreign_key: :owner_id

  before_save  :ensure_authentication_token
  after_create :create_user_profile

  accepts_nested_attributes_for :profile, update_only: true

  delegate :first_name, :last_name, to: :profile, allow_nil: true

  def participate_in?(project)
    project_users.exists?(project_id: project.id)
  end

  private

  def create_user_profile
    build_profile
    profile.save(validates: false)
  end

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.exists?(authentication_token: token)
    end
  end
end
