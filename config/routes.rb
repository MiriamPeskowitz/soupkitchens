Rails.application.routes.draw do
 
  get 'sessions/new'
  get 'sessions/logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#home'

  get '/signup', to: 'users#new', as: 'signup'
  get '/signin', to: 'sessions#new', as: "signin"
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: "logout"


  resources :users
  resources :soupkitchens do
  	resources :comments
  end 
end
