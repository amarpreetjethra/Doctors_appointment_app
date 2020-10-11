Rails.application.routes.draw do
  resources :availabilities
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root "doctors#index"
  
  resources :patients
  resources :doctors do
    resources :appointments, only: [:index,:new, :create, :destroy]
    
  end

  
end