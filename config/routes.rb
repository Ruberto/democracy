Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'home#topics'
  get '/ballots', to: 'home#ballots'
  get '/results', to: 'home#results'
  get '/lol', to: 'home#lol'
end
