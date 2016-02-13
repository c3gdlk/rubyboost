source 'http://rubygems.org'
ruby '2.2.3'

gem 'rails', '4.2.5'
gem 'uglifier'

gem 'simple_form'

gem 'pg', '0.17.1'
gem 'puma', '1.5.0'

gem 'kaminari'

gem 'carrierwave', '0.9.0'

gem 'sass'
gem 'mini_magick'

gem 'sass-rails'
gem 'haml-rails'
gem 'coffee-rails'
gem 'font-awesome-sass'
gem 'jquery-rails'
gem 'jquery-ui-rails'


group :production, :release, :staging do
  gem 'rails_12factor'
  gem 'heroku_rails_deflate'
end

group :test, :development do
  gem 'simplecov'
  gem 'rails_dt'
  gem 'byebug'
  gem 'pry'
  gem 'spring'
  gem 'faker'
  gem 'quiet_assets'
  gem 'dotenv-rails', require: 'dotenv/rails-now'
  gem 'factory_girl_rails'
end

group :development do
  gem 'letter_opener'
  gem 'annotate'
  gem 'better_errors'
  gem 'spring-commands-rspec'
end

group :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'capybara-webkit'
  gem 'database_cleaner'
end
