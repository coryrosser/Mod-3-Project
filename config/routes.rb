Rails.application.routes.draw do
  resources :trades
  resources :line_items
  resources :items
  resources :profiles
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
