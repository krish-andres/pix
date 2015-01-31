Rails.application.routes.draw do


  resources :albums

  resources :groups

  get '/signin' => 'sessions#new'
  resource :session, only: [:new, :create, :destroy]

  get '/signup' => 'users#new'
  resources :users

  resources :photos, except: [:index] do
    resources :comments, only: [:create, :destroy]
  end

  root 'homes#show'
end
