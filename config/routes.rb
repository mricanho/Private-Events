Rails.application.routes.draw do
  resources :attendances, skip: [:destroy, :edit, :show, :update]
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :events, skip: [:destroy, :edit, :show, :update]
  root "events#index"
end
