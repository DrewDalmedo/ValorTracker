Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root webpage
  root 'application#home'


  # user registration, login and authentication routes:
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  get 'login' => 'users#new'
  post 'login' => 'users#create'
  # add user nested routes here!
  post 'logout' => 'sessions#destroy'


end
