source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.12'
# Use SCSS for stylesheets
gem 'sassc-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
# gem 'webpacker', '~> 4.x'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

gem 'devise'
gem 'omniauth'
gem 'omniauth-google-oauth2'

gem 'mini_magick'
gem 'carrierwave'
gem 'fog-aws'

gem 'ridgepole'

gem 'jquery-rails'

gem 'rails-i18n', '~> 5.1'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'i18n-js'

gem 'materialize-sass', '~> 1.0.0'
gem 'material_icons'

gem 'dotenv-rails', '~> 2.7', '>= 2.7.1'

gem 'kaminari'

gem 'geocoder'

gem 'enum_help'

gem 'globalize', '~> 5.3.0'

gem 'chart-js-rails'

gem 'font-awesome-sass'

gem 'faker'

gem 'piet'

gem 'piet-binary'

gem 'lograge'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'i18n-tasks'
  gem 'rspec-rails'
  gem 'factory_bot_rails', require: false
  gem 'spring-commands-rspec'
  gem 'rails-controller-testing'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'database_rewinder'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'rb-readline'
  gem 'hirb'
  gem 'hirb-unicode-steakknife'
  gem 'rubocop-faker'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop', require: false
  gem 'rubocop-rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'solargraph', group: :development
end

group :test do
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
