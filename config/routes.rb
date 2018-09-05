Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.
  root to: 'projects#index'

  resources :projects
  resources :tickets
end
