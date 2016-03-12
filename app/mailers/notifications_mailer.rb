class NotificationsMailer < ApplicationMailer

  def new_article(article, recipient)
    @recipient = recipient
    @article   = article

    mail(to: recipient.email, subject: 'New article')
  end
end
