class ScheduleNewArticleNotificationWorker
  include Sidekiq::Worker

  sidekiq_options queue: 'notifications', failure: true

  def perform(article_id)
    article = Article.find(article_id)

    article.project.participants.pluck(:user_id).each do |user_id|
      NewArticleNotificationWorker.perform_async(article_id, user_id)
    end
  end
end
