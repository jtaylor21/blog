Blog::Application.routes.draw do

  resources :posts

  get '/posts/:permalink' => 'posts#show', as: :permalink

  get '/login' => 'sessions#new', as: :login
  get '/logout' => 'sessions#destroy', as: :logout
  post '/sessions' => 'sessions#create'

  root to: 'pages#home'

end
