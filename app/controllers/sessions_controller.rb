class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    sign_in User.find_or_create_from_auth_hash(auth_hash)
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end