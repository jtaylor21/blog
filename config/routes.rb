Blog::Application.routes.draw do

  resources :posts, path: 'blog'

  get '/blog/:permalink' => 'posts#show', as: :permalink

  get '/login' => 'sessions#new', as: :login
  get '/logout' => 'sessions#destroy', as: :logout
  post '/sessions' => 'sessions#create'

  root to: 'pages#home'

  match "*path" => redirect('/') unless Rails.env.development?

end
