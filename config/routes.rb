Rails.application.routes.draw do
  resources :products
  get "/products/overdue", to: "products#overdue", as: "overdue"
  get '/zomg', to: 'products#zomg', as: 'zomg'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
