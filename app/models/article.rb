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

  belongs_to :project
  has_many   :comments, as: :commentable
  has_many   :activities, as: :trackable

  validates :title, :content, presence: true

  after_create :send_notifications

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
    project.participants.each do |user|
      NotificationsMailer.new_article(self, user).deliver
    end
  end
end
