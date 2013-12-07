source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'jquery-rails'
gem 'formtastic'
gem 'nested_form'
gem 'devise'
gem 'kaminari'
gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails',
                          :github => 'anjlab/bootstrap-rails',
                          :branch => '3.0.0'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'pry-rails'
  gem 'sqlite3'
end

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
  gem 'pg'
end

gem 'activerecord-postgresql-adapter'