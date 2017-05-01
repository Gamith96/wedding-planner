Rails.application.routes.draw do

  # facebook setting
  match 'auth/:provider/callback', to: 'sessions#create', :via => [:get, :post]
  match 'auth/failure', to: redirect('/'), :via => [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', :via => [:get, :post]

  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :weddings
  root to: "users#index"

  resources :guests
  resources :locations
end
