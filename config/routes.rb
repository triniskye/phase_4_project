Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  get "/pets" => "pets#index"
  get "/pets/:id" => "pets#show"

end
