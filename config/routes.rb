# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  resources :users, only: [:show]

  get '/users/:id/discover', to: 'users#discover'

  get '/users/:id/movies', to: 'movies#results'
  get '/users/:id/movies/:movie_id', to: 'movies#details'

  get '/users/:id/movies/:movie_id/viewing-party/new', to: 'viewing_party#new'
  post '/users/:id/movies/:movie_id/viewing-party/new', to: 'viewing_party#create'
end
