class ProjectSweeper < BaseSweeper

  def self.expire_cache(record)
    new.expire_cache(record)
  end

  def expire_cache(record)
    expire_custom_action('index', record.user.id)
  end

  private

  def controller_name
    '/projects'
  end
end
