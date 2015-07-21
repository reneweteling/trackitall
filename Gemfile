source 'https://rubygems.org'

ruby '2.2.2'

gem 'rails', '4.2.3'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'

gem 'active_model_serializers'
gem 'slim-rails'
gem 'carrierwave'
gem 'activeadmin', github: 'activeadmin'
gem 'simple_form'
gem 'devise'
gem 'slim-rails'
gem 'omniauth'
gem 'omniauth-github'


source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap-sass'
  gem 'rails-assets-font-awsome'
  gem 'rails-assets-select2', '= 3.5.2'
  gem 'rails-assets-select2-bootstrap'
end

group :production do
	# for heroku
	gem 'puma'
	gem 'rails_12factor'
end

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'xray-rails'
  gem 'quiet_assets'
  gem 'guard'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'guard-livereload', require: false
end

group :test do
	gem 'rake'
  gem 'minitest-reporters'
  gem 'minitest-rails'
  gem 'minitest-rails-capybara'
  gem 'selenium-webdriver'
end

