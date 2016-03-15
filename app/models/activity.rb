class Activity < ActiveRecord::Base
  KIND_ARTICLE_APPROVED = 'approved'
  KIND_ARTICLE_REJECTED = 'rejected'
  KIND_ARTICLE_NEW_COMMENT = 'comment'

  belongs_to :recipient, class_name: 'User', foreign_key: :recipient_id
  belongs_to :owner,     class_name: 'User', foreign_key: :owner_id
  belongs_to :trackable, polymorphic: true

  scope :recent, -> { order(created_at: :desc) }
end
