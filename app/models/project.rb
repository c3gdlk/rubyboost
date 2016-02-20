class Project < ActiveRecord::Base
  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }

  validates :title, presence: true, length: { maximum: 20 }

  mount_uploader :picture, ProjectPictureUploader
end
