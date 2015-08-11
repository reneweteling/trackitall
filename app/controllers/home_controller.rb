class HomeController < ApplicationController
  def index
    oauth = current_user.oauths.first
    @repos = oauth.repos
    @commits = oauth.commits('reneweteling/trackitall')
  end
  
end