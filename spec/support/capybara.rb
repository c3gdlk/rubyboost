require 'capybara/rspec'
require 'capybara/rails'

Capybara.configure do |config|
  config.javascript_driver = :webkit
end

Capybara::Webkit.configure do |config|
  config.timeout = 120
  config.block_unknown_urls
end
