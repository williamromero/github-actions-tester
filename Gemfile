source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'jbuilder' # Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'mysql2', '~> 0.5' # Use mysql as the database for Active Record
gem 'puma', '~> 5.0' # Use the Puma web server [https://github.com/puma/puma]
gem 'rails', '~> 7.0.2', '>= 7.0.2.2' # Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"

# gem "redis", "~> 4.0" # Use Redis adapter to run Action Cable in production
# gem "kredis" # Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "bcrypt", "~> 3.1.7"

gem 'bootsnap', require: false # Reduces boot times through caching; required in config/boot.rb
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem

# gem "rack-cors" # Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw] # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'shoulda-matchers'
end

group :development do
  # gem "spring" # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  gem 'annotate'
end
