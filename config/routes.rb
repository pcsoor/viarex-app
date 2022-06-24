Rails.application.routes.draw do
  devise_for :users
  resources :orders
  resources :order_items
  post "orders/submit", to: "orders#submit"
  root to: "page#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
