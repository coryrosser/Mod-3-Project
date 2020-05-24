Rails.application.routes.draw do
  resources :trades
  resources :line_items
  resources :items
  resources :profiles
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  
get 'login', to: 'sessions#new'
post 'login', to: 'sessions#create'

end
