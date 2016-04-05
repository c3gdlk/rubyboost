class Project < ActiveRecord::Base
  belongs_to :user
  has_many :project_users
  has_many :participants, through: :project_users, source: :user
  has_many :articles, dependent: :destroy

  scope :recent, -> { order(created_at: :desc) }

  validates :title, presence: true, length: { maximum: 20 }

  after_save :expire_cache
  after_destroy :expire_cache

  mount_uploader :picture, ProjectPictureUploader

  private

  def expire_cache
    ProjectSweeper.expire_cache self
  end
end
