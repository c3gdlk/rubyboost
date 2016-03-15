require 'sidekiq'
require 'sidekiq-status'

Sidekiq.configure_server do |config|
  config.redis = { namespace: "rubyboost_#{Rails.env}" }

  config.server_middleware do |chain|
    chain.add Sidekiq::Status::ServerMiddleware, expiration: 30.minutes # default
  end
end

Sidekiq.configure_client do |config|
  config.redis = { namespace: "rubyboost_#{Rails.env}" }

  config.client_middleware do |chain|
    chain.add Sidekiq::Status::ClientMiddleware
  end
end
