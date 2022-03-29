Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "products/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "pages#home"
  get "/pages/home" => "pages#home"
  get "/pages/about" => "pages#about"
  get "/products/index/" => "products#index"
  get "/products/new/" => "products#new"
  get "/products/sale/" => "products#sale"
end
