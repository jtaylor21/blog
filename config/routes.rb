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

  # Legacy routes
  # http://vincentcabansag.com/posts/13/networking-events-for-code-academy-students
  # http://vincentcabansag.com/posts/12/lessons-from-code-academy-students
  # http://vincentcabansag.com/posts/11/seventh-week-of-code-academy
  # http://vincentcabansag.com/posts/8/configuring-the-paperclip-gem
  # http://vincentcabansag.com/posts/10/sixth-week-of-code-academy
  # http://vincentcabansag.com/posts/7/fifth-week-of-code-academy
  # http://vincentcabansag.com/posts/6/fourth-week-of-code-academy
  # http://vincentcabansag.com/posts/5/third-week-of-code-academy
  # http://vincentcabansag.com/posts/4/second-week-of-code-academy
  # http://vincentcabansag.com/posts/3/first-week-of-code-academy
  # http://vincentcabansag.com/posts/2/hello-world%21

end
