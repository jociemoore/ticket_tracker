Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.
  root to: 'projects#index'

  get '/signup', to: 'users#new', as: :signup
  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: :logout

  resources :projects
  resources :tickets do
    resources :comments, except: [:index, :show, :new, :destroy]
  end
  resources :tags, except: [:show]
  resources :users, only: [:create]
end
