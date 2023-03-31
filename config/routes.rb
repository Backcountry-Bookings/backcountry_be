Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do 
    namespace :v1 do
      resources :campsites, only: [:show, :index]
      resources :favorites, only: [:index, :create, :destroy]
      resources :reviews, only: [:index, :create]
    end
  end
end
