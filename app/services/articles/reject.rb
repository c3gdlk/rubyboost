class Articles::Reject
  include SimpleService

  class Result
    include SimpleServiceResult

    def initialize(success, comment_for_reject)
      self.success, self.comment_for_reject = success, comment_for_reject
    end

    def []=(name, value)

    end
  end

  def perform(article, user, body)
    comment_for_reject = user.comments.build(body: body)

    Article.transaction do
      if comment_for_reject.save
        article.reject!
        article.comments << comment_for_reject
        reject_notification(article)

        return Result.new true, comment_for_reject
      end
    end

    Result.new false, comment_for_reject
  end

  private

  def reject_notification(article)
    #notify author about article reject
  end
end
