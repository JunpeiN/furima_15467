Rails.application.routes.draw do
  get 'items/index'
  devise_for :users
  #仮のルーティング設定
  root "items#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
