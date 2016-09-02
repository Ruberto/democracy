Rails.application.routes.draw do

  resources :ballots, only: [:create]
  resources :results, only: [:index]
  resources :topics, only: [:create, :index, :show, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
