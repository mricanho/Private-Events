Rails.application.routes.draw do
  resources :events, only: %i[new create show index]
  resources :users, only: %i[new create show]
  root 'events#index'
  get 'attendances/create'
  get '/sign_in', to: 'users#sign_in'
  post '/sign_in', to: 'users#sign_in_new'
  get '/sign_out', to: 'users#sign_out'
  post '/sign_in', to: 'events#enroll'
  resources :attendances
end
