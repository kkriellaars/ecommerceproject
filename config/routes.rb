Rails.application.routes.draw do
  get 'products/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "pages#home"
  get "/pages/home" => "pages#home"
  get "/pages/about" => "pages#about"
  get "/products/index/" => "products#index"
end
