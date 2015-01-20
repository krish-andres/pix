Rails.application.routes.draw do

  get '/signin' => 'sessions#new'
  resource :session, only: [:new, :create, :destroy]

  get '/signup' => 'users#new'
  resources :users do
    resources :photos, except: [:index]
  end

  root 'homes#show'
end
