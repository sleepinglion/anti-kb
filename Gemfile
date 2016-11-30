source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'bootstrap-sass'
gem 'jquery-ui-rails'
gem 'ui_datepicker-rails3'
gem 'kaminari'
gem 'carrierwave'
gem 'devise'
gem 'impressionist'
gem 'mini_magick'
gem 'cancan'
gem 'ckeditor', :path=>"vendor/gems/ckeditor"
gem 'fancybox2-rails', :path=>"vendor/gems/fancybox2-rails"
gem 'fog'
gem 'unf'
gem 'jquery-easing-rails'
gem 'sitemap_generator'
gem 'meta-tags'
gem 'email_validator'
gem 'listen'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'capistrano', '~> 3.0'
  gem 'capistrano-bundler'
  gem 'capistrano-rails', '~> 1.0.0'
  gem 'sqlite3'  
  gem 'web-console'
end

group :production do
  gem 'mysql2'  
  gem 'asset_sync'
  gem 'thin'
  gem 'connect'
  gem 'redis-rails'
  gem 'dotenv-rails'
  gem 'recaptcha', :require => 'recaptcha/rails'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
