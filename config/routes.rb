Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'ingredients#index'

  resources :orders
  get 'orders_list', to: 'orders#orders_list'

  resources :ingredients, only: [:index]
  resources :dishes, only: [:index]

end
