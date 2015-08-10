class Oauth < ActiveRecord::Base
  belongs_to :user
  validates_presence_of [:provider, :user, :uid]

  SITE_URL = "https://api.github.com/"

  def repos
    get 'user/repos'
  end

  def commits(full_name)
    get "repos/#{full_name}/commits"
  end

  private

  def post(path, payload)
    uri = construct_uri path 
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    req = Net::HTTP::Post.new(uri.path)
    req.body = payload.to_json
    req["Authorization"] = "token #{token}"
    # req["Content-Type"] = "application/json"
    JSON.parse http.request(req).body
  end

  def get(path)
    uri = construct_uri path
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    req = Net::HTTP::Get.new(uri.path)
    req["Authorization"] = "token #{token}"
    JSON.parse http.request(req).body
  end

  def construct_uri(path)
    return URI.parse(SITE_URL + path)
  end

end
