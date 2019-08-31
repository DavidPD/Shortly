Rails.application.routes.draw do
  post '/', action: 'create', controller: 'shortened_url'
  get '/:hash', action: 'show', controller: 'shortened_url'
end
