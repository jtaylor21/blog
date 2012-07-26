Blog::Application.routes.draw do

  match '/posts/:id/:permalink' => 'posts#show', :as => :permalink

  root :to => 'posts#index'

  resources :posts
  resources :users
  resources :settings, :only => [:update, :edit, :index]

  match '/signup', :to => 'users#new'

  match 'login' => 'sessions#new', :as => :login
  post 'sessions/create'
  delete 'sessions/destroy'

  match "*path" => redirect('/')

end
