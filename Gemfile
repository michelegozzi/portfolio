source 'https://rubygems.org'
ruby "1.9.3"
#source 'vendor/cache'

gem 'rails', '3.2.11'
gem 'therubyracer'
gem 'rspec'
gem 'bootstrap-sass', '~> 3.1.1'
gem 'sass-rails',   '~> 3.2.3'
gem 'bcrypt-ruby', '3.0.1'
gem 'faker', '1.3.0'
gem 'will_paginate', '3.0.3'
gem 'will_paginate-bootstrap', '1.0.0'
gem 'jquery-rails'
gem 'debugger', group: [:development, :test]
gem 'dropbox-sdk'

  
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails', '2.11.0'
  #gem 'guard-rspec', '1.2.1'
  #gem 'guard-spork', '1.2.0'
  #gem 'spork', '0.9.2'
  gem 'annotate', '2.5.0'
  gem 'guard-test'
  gem 'guard-spork'
  gem 'spork-testunit'
end



# Gems used only for assets and not required
# in production environments by default.
group :assets do
  
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :test do
  gem 'capybara', '~> 2.1.0'
  gem 'capybara-webkit'
  #gem 'rb-inotify', '0.8.8'
  #gem 'libnotify', '0.5.9'
  gem 'factory_girl_rails', '4.1.0'
  gem 'database_cleaner', '1.2.0'
  gem 'cucumber-rails', '1.2.1', :require => false
  gem 'rspec-expectations'
  gem 'poltergeist', ">= 1.4.0"
  gem 'selenium-webdriver'
  gem 'launchy'
  gem 'rest-client'
  gem 'rb-inotify', '~> 0.9'
  gem 'ruby-prof'
end

group :production do
  gem 'pg', '0.12.2'
end
