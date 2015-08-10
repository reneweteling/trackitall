class HomeController < ApplicationController
  def index
    oauth = current_user.oauths.first
    @data = oauth.commits(oauth.repos.first['full_name']).count
  end
  
end