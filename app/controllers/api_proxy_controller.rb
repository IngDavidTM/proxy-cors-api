class ApiProxyController < ApplicationController
  require 'httparty'

  def proxy_request
    url = "https://torre.bio/api/bios/#{params[:username]}"
    uri = URI(url)
    response = HTTParty.get(uri)
    puts response
    render json: response
  end
end
