class ApplicationController < ActionController::Base
  before_action :basic_auth

  private

  def basic_auth
    authenticare_or_request_with_http_basic do |username, passward|
      username == ENV["BASIC_AUTH_USER"] && passward == ENV["BASIC_AUTH_PASSWARD"]
    end
  end

end
