Blog::Application.routes.draw do

  match '/posts/:title', :controller => 'posts', :action => 'show', :as => :title

  root :to => 'posts#index'

  resources :posts
  resources :users
  resources :settings, :only => [:update, :edit, :index]

  match '/signup', :to => 'users#new'

  match 'login' => 'sessions#new', :as => :login
  post 'sessions/create'
  delete 'sessions/destroy'

end
