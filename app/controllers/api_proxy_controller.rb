class ApiProxyController < ApplicationController
  require 'httparty'

  def proxy_request
    url = "https://torre.bio/api/bios/#{params[:username]}"
    uri = URI(url)
    response = HTTParty.get(uri)
    response.headers['X-Requested-With'] = 'XMLHttpRequest'
    response.headers['Access-Control-Allow-Origin'] = 'https://torre.bio/api/bios/'
    puts response
    render json: response
  end
end
