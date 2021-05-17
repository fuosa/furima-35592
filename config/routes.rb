Rails.application.routes.draw do
  get 'item_infos/new'
  devise_for :users
  root to: "items#index"
  resources :items, only: [:index, :new, :create]
end
