Rails.application.routes.draw do
# config/routes.rb
  resources :tickets
  resources :orders
 resources :employees do
    post 'approve', on: :member
    post 'reject', on: :member
  end

  root to: 'employees#index'

end
