source 'http://rubygems.org'

gem 'rails', '3.1.3'
gem 'pg'

gem 'awesome_nested_set'

# Use bootstrap and formtastic all nicely:
# http://rubysource.com/too-good-to-be-true-twitter-bootstrap-meets-formtastic-and-tabulous/
gem 'formtastic-bootstrap'

# Use haml for html
gem 'haml'

# Use devise for authentication
gem 'devise'
# and cantango for roles
gem 'cantango'

# Decorator pattern for Rails models
gem 'draper'

group :development do
  # In case you don't have node.js
  gem 'execjs'
  gem 'therubyracer'
end

# Use Heroku for the demo
gem 'heroku'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'compass', git: 'http://github.com/chriseppstein/compass.git'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :test do
  # We'll use minitest for this project
  gem 'minitest'
  gem 'minitest-rails'
  gem 'factory_girl'
  gem 'capybara'
  gem 'capybara_minitest_spec'
  gem 'database_cleaner'
  gem 'delorean'

  # Pretty printed test output
  gem 'turn', '~> 0.8.3', :require => false
end

# Add your own local bundler stuff
local_gemfile = File.expand_path '../.Gemfile', __FILE__
instance_eval File.read local_gemfile if File.exists? local_gemfile
