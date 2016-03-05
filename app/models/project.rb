class Project < ActiveRecord::Base
  belongs_to :user
  has_many :project_users
  has_many :participants, through: :project_users, source: :user
  has_many :articles, dependent: :destroy

  scope :recent, -> { order(created_at: :desc) }

  validates :title, presence: true, length: { maximum: 20 }

  mount_uploader :picture, ProjectPictureUploader
end
