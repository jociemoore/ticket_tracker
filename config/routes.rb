Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.
  root to: 'projects#index'

  get '/signup', to: 'users#new', as: :signup

  resources :projects
  resources :tickets
  resources :tags, except: [:show]
  resources :users, only: [:create]
end
