Rails.application.routes.draw do

  resources :ballots
  resources :topics, only: [:create, :index, :show, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'home#topics'
  get '/ballot', to: 'home#ballot'
  get '/results', to: 'home#results'
end
