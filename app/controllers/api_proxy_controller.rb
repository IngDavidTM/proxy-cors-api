class ApiProxyController < ApplicationController
  require 'httparty'

  def proxy_request
    url = "https://torre.bio/api/bios/#{params[:username]}"
    uri = URI(url)
    response = HTTParty.get(uri)
    response.headers['X-Requested-With'] = 'XMLHttpRequest'
    response.headers['Access-Control-Allow-Origin'] = 'https://torre.bio/api/bios/'
    experiences = response['experiences'].select { |hash| hash['category'] == 'jobs' }
    person = { name: response['person']['name'], picture: response['person']['picture'] }
    strengths = { strengths: response['strengths'].map { |strength| { name: strength['name'], proficiency: strength['proficiency'], weight: strength['weight'], recommendations: strength['recommendations'] } } }
    render json: { person: person, experiences: experiences, strengths: strengths }
  end
end
