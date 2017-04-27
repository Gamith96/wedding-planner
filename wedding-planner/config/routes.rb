Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :weddings
  root to: "users#index"

  resources :guests
  root to: "guests#index"

  resources :locations
  root to: "locations#index"

end
