Rails.application.routes.draw do
  # 実装とは関係ないので一旦コメントアウト
  # get 'item_infos/new'
  # 実装とは関係ないので一旦コメントアウト
  
  devise_for :users
  root to: "items#index"

  resources :items, only: [:index, :new, :create]
end
