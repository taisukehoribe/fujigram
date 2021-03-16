Rails.application.routes.draw do

  root to: 'homes#top'

  get '/home/about' => 'homes#about'

  devise_for :users

  resources :users, only: [:index, :show, :edit, :update]

  resources :photos, except: [:new] do
    resource :favorites, only: [:create, :destroy]
    resources :photo_comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
