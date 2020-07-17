Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root webpage
  root 'application#home'


  # user registration, login and authentication routes:
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  # registration
  get 'register' => 'users#new'
  post 'register' => 'users#create'
  # add user nested routes here!
  resources :users, only: [:show, :edit, :update] do
    #resources :matches
    resources :guides
    get 'guides/:id/delete' => 'guides#destroy', as: 'delete_guide'
  end
  get 'logout' => 'sessions#destroy'

  resources :maps
  get 'maps/:id/delete' => 'maps#destroy', as: 'delete_map'
  
  resources :guides, only: [:index, :show]
end
