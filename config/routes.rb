Rails.application.routes.draw do
  resources :events
  resources :users, only: %i[new create show]
  root 'events#index'
  
end
