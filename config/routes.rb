Rails.application.routes.draw do
  devise_for :customers
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "products/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "products#index"
  get "/pages/home" => "products#index"
  get "/pages/about" => "pages#about"
  get "/products/index/" => "products#index"
  get "/products/new/" => "products#new"
  get "/products/sale/" => "products#sale"
  get "/products/updated/" => "products#updated"
  get "/products/:id", to: "products#show"
  get "/categories/index/" => "categories#index"
  get "/categories/:id" => "categories#show"
  get "/orders/new" => "orders#new"
  get "/orders/create" => "orders#create"
  get "/pages/search" => "pages#search"

  resources :cart, only: %i[create destroy update]
end
