Rails.application.routes.draw do

  root to: "home#index"
  get '/create_account', to: 'home#show'
  devise_for :users , :skip => [:registrations]
  resources :costumers
  resources :shops
  resources :products

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
