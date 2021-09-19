Rails.application.routes.draw do
  #get 'users/index'
  #get 'users/show'
  devise_for :users
  root to: 'homes#top'
  get 'about' => 'homes#show'
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
