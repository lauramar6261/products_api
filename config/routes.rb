Rails.application.routes.draw do
  get "/products/overdue", to: "products#overdue", as: "overdue"
  resources :products
  get '/zomg', to: 'products#zomg', as: 'zomg'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
