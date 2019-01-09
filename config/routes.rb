Rails.application.routes.draw do
  get 'products/show'
  get 'products/index'
  get 'products/create'
  get 'products/new'
  get 'products/edit'
  get 'products/update'
  get 'products/destroy'
  get 'products/overdue'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
