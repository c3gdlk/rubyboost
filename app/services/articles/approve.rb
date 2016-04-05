class Articles::Approve
  inlude SimpleService

  class Result
    include SimpleServiceResult
  end

  def perform(article, user, body)
    ###
  end

  private

  def reject_notification(article)
    #notify author about article reject
  end
end
