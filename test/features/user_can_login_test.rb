require "test_helper"

class UserCanLoginTest < Capybara::Rails::TestCase
 
	feature "User login flow" do

		scenario "Login from homepage", :js => false do
			login
			assert page.has_content?("Hours"), "Not signed in"
		end

  	scenario "Edit hour", :js => true do
  		login

		  visit edit_hour_path( User.first.hours.first )

		  fill_in 'hour[description]', :with => 'Jawel andere test'
		  click_button 'Save'

		  assert page.has_content?("Jawel andere test"), "Hour not updated"
	  end

	  # scenario "Insert new hour", :js => true do
  	# 	login

		 #  visit new_hour_path

		 #  page.execute_script('$("#hour_hourtype_id").select2("data", {id: "1", title: "Programming"});')
		 #  page.execute_script('$("#hour_project_id").select2("data", {id: "1", title: "Building TrackItAll (Weteling Support)"});')
		 #  fill_in 'hour[duration_human]', :with => '2h'
		 #  fill_in 'hour[description]', :with => 'Jawel andere test twee'
		 #  click_button 'Save'

		 #  assert page.has_content?("Hours"), "Hour not saved"
	  # end
	end

	private
		def login
			visit root_path
		
		  fill_in 'session[email]', :with => 'rene@weteling.com'
		  fill_in 'session[password]', :with => 'test1234'
			
			click_button 'Sign in'
		end

end
