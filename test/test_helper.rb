ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
require "minitest/rails/capybara"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL
  
  # color output
	Minitest::Reporters.use!


	

	Capybara.register_driver :chrome do |app|
	  Capybara::Selenium::Driver.new(app, :browser => :chrome)
	end

	Capybara.register_driver :selenium do |app|
		
	  custom_profile = Selenium::WebDriver::Firefox::Profile.new
	  # Turn off the super annoying popup!
	  custom_profile["network.http.prompt-temp-redirect"] = false

	  Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => custom_profile)
	end

	Capybara.javascript_driver = :selenium
end
