Blog::Application.routes.draw do

  resources :posts

  get '/posts/:permalink' => 'posts#show', as: :permalink

  root to: 'pages#home'

end
