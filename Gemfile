source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'


group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'thin'
  gem 'therubyracer-heroku', '~> 0.8.1.pre3'
end

# Asset template engines
gem 'sass-rails', "~> 3.1.0.rc"
gem 'compass', :git => 'https://github.com/chriseppstein/compass.git', :branch  => 'rails31'
gem 'eleven40'
gem 'coffee-script'
gem 'uglifier'

gem 'jquery-rails'

gem 'omniauth'
gem 'haml'

gem "friendly_id", "~> 3.3.0.alpha2"

gem "acts-as-taggable-on"

gem "RedCloth"

gem "heroku"

gem "transloadit"

gem "json"

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'shoulda'
  gem 'mocha'
end
