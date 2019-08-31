Rails.application.routes.draw do
  get '/', action: 'index', controller: 'shortened_url'
  post '/', action: 'create', controller: 'shortened_url'
  get '/:hash', action: 'show', controller: 'shortened_url'
end
