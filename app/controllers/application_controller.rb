class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_admin_user!
	  redirect_to sign_in_path unless signed_in? && current_user.admin
	end


	# def current_user
	# 	User.find( 1 )
	# end




end
