source 'https://rubygems.org'

# ruby '2.3.0'
gem 'rails', '>= 5.0.0.rc1', '< 5.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass'
gem "font-awesome-rails"
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'remotipart', github: 'mshibuya/remotipart', ref: '3a6acb3'

gem 'jbuilder', '~> 2.0'


gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'figaro'
gem 'paperclip'
gem 'aws-sdk', '< 2.0'
gem 'sidekiq'
gem 'redis'
gem 'octokit'
gem 'phantomjs'

group :production do 
  gem 'rails_12factor'
end

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'database_cleaner'
  gem "factory_girl_rails"
  gem 'faker'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem "chromedriver-helper", "1.0.0"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
