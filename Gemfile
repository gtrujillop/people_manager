source 'https://rubygems.org'
ruby "2.2.0"

gem 'rails', '4.2.0'

gem 'rails-api'

gem 'jwt'

gem 'rack-cors', :require => 'rack/cors'
gem 'active_model_serializers', '~> 0.9.4'
gem 'validates_timeliness', '~> 4.0'

gem 'resque'
gem 'resque-scheduler'

group :test do
  gem 'shoulda'
end

gem 'codeclimate-test-reporter', group: :test, require: nil

group :development, :test do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Use mysql2 as the database for Active Record
  gem 'mysql2', '~> 0.3.18'
  # Access an IRB console on exception pages or by using <%= console %> in views
  #gem 'web-console', '~> 2.0'
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'capybara', '~> 2.4.4'
  gem "capybara-webkit"
end

group :cucumber do
  gem 'cucumber'
end

group :production do
  gem 'pg',             '0.17.1'
  gem 'rails_12factor', '0.0.2'
end

# To use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano', :group => :development

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

