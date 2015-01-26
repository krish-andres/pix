Rails.application.routes.draw do


  get '/signin' => 'sessions#new'
  resource :session, only: [:new, :create, :destroy]

  get '/signup' => 'users#new'
  resources :users

  resources :photos, except: [:index] do
    resources :comments
  end

  root 'homes#show'
end
