

Rails.application.routes.draw do
  get 'home/index'

  root 'home#index'

  get '/signup', to: 'users#new'
  resources :users
  resources :categories

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
