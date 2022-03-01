Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  
  resources :pets, only: [:index, :create, :new, :show]

  # get "/pets" => "pets#index"
  # post "/pets" => "pets#create"
  # get "/pets/new" => "pets#new", as: "new_pet"
  # get "/pets/:id" => "pets#show", as: "pet"
  get "/news" => "static#news"
  get "/contact" => "static#contact"

  
  get "/login" => "users#login"
  get "/signup" => "users#signup"
  post "/sessions" => "sessions#create"
  post "/users" => "users#create"
  get "/account" => "users#account"

  root to: "pets#index"

end
