Rails.application.routes.draw do
  get '/api/bios/:username', to: 'api_proxy#proxy_request'
end
