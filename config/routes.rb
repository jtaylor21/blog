Blog::Application.routes.draw do

  root :to => 'posts#index'

  resources :posts
  resources :users
  resources :settings, :only => [:update, :edit, :index]

  match '/signup',  :to => 'users#new'

  get "sessions/new", :as => :login_page
  post "sessions/create"
  delete "sessions/destroy"

  # omniauth-twitter
  # match '/auth/twitter/callback', to: 'sessions#create'

end
