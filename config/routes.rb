Rails.application.routes.draw do
  root to: 'articles#index'

  get '/signup', to: 'users#new'
  resources :users, only: [:new, :show, :create]
  resources :categories

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :articles do
    resources :votes, only: %i[create destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
