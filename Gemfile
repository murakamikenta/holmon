source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'
gem 'bootstrap-sass', github: 'thomas-mcdonald/bootstrap-sass'
gem 'kaminari'
gem 'bcrypt-ruby' , '~> 3.0.0'

# for heroku
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'better_errors'
  gem 'guard-rspec'
  gem 'spork-rails'
  gem 'guard-spork'
  gem 'childprocess' # for spork
  gem 'sqlite3'
end
# Use sqlite3 as the database for Active Record
group :test do
  gem 'capybara'
  gem 'factory_girl_rails'
end

group :assets do
  gem 'sass-rails', '~> 4.0.0' # Use SCSS for stylesheets
  gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets
  gem 'coffee-rails', '~> 4.0.0' # Use CoffeeScript for .js.coffee assets and views
end

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]