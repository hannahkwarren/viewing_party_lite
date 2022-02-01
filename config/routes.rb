Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root '/'
  get '/', to: 'root#index'
  
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  
  resources :users, only: [:show]

  get '/users/:id/discover', to: 'users#discover'
  get '/users/:user_id/movies', to: 'movies#top_rated'

end
