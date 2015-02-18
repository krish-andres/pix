Rails.application.routes.draw do

  resources :groups do
    resources :albums, except: [:index, :edit, :update] do
      resources :photos, except: [:index] do
        resources :comments, only: [:create, :destroy]
      end
    end
  end

  get '/signin' => 'sessions#new'
  get '/signout' => 'sessions#destroy'
  resource :session, only: [:new, :create, :destroy]

  get '/signup' => 'users#new'
  resources :users

  root 'homes#show'
end


# /photos/2

# @album = Photo.find(id: params[:id]).album

# <%= link_to album_path(@album) %>
# figure out which album photo 2 belongs to


# $.get("/photos/new", {album_id: album.id});



# /photos/new
# params[:album_id] 
