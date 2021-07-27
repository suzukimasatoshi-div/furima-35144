Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users
  root 'items#index'
  resources :messages, only: [:create]
  resources :items do
    resources :purehases, only: [ :index, :create ]
  end
end
