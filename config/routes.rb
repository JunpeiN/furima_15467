Rails.application.routes.draw do
  devise_for :users,controllers: {
    sessions: 'users/sessions'
  }
  get 'items/index'
  #仮のルーティング設定
  root "items#index"
  resources :items

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
