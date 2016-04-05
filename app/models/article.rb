class Article < ActiveRecord::Base
  include AASM

  class ModeratorNotification
    attr_accessor :article

    def initialize(article, options={})
      self.article = article
    end

    def call
      puts "Notify moderator: New article: #{article.title}"
    end
  end
  private_constant :ModeratorNotification

  belongs_to :project, touch: true
  has_many   :comments, as: :commentable
  has_many   :activities, as: :trackable

  scope :order_by_date, -> (direction) { order(created_at: direction.to_sym) }

  validates :title, :content, presence: true

  after_commit :send_notifications

  aasm column: :state do
    state :pending, initial: true
    state :moderation
    state :approved
    state :rejected

    event :send_for_moderation do
      transitions from: :pending, to: :moderation, after: ModeratorNotification
    end

    event :approve do
      transitions to: :approved
    end

    event :reject do
      transitions from: :moderation, to: :rejected
    end
  end

  private

  def send_notifications
    ScheduleNewArticleNotificationWorker.perform_async(id)
  end
end
