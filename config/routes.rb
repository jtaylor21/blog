Blog::Application.routes.draw do

  resources :posts, path: 'blog'

  get '/blog/:permalink' => 'posts#show', as: :permalink

  get '/login' => 'sessions#new', as: :login
  get '/logout' => 'sessions#destroy', as: :logout
  post '/sessions' => 'sessions#create'
  get '/resume' => 'pages#resume', as: :resume

  root to: 'pages#home'

  get "*path" => redirect('/') unless Rails.env.development?

end
