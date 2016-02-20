class Project < ActiveRecord::Base
  scope :recent, -> { order(created_at: :desc) }

  validates :title, presence: true, length: { maximum: 20 }

  mount_uploader :picture, ProjectPictureUploader
end
