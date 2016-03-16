class NewArticleNotificationWorker
  include Sidekiq::Worker

  sidekiq_options queue: 'notifications', retry: true, failure: true

  def perform(article_id, user_id)
    article = Article.find(article_id)
    user    = User.find(user_id)

    NotificationsMailer.new_article(article, user).deliver
  end
end
