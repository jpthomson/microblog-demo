source 'https://rubygems.org'

gem 'rails', '3.2.9'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production do
  gem 'pg'
  gem 'dalli'
  gem 'tire'
end
group :development, :test do
  gem 'sqlite3'
end

gem 'cache_digests'

gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-github'

gem "cancan"
gem "rolify"

gem "activeadmin", :git => "git://github.com/gregbell/active_admin.git"

group :test, :development do
  gem "rspec-rails"
  gem "cucumber-rails", :require => false
  gem "database_cleaner"
  gem "factory_girl_rails"
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyrhino'

  gem 'uglifier', '>= 1.0.3'
  
  gem 'compass-rails'
  gem 'zurb-foundation'
end

gem 'jquery-rails'

gem 'rails_config'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'

# To use debugger
# gem 'debugger'
