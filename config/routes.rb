Rails.application.routes.draw do
  devise_for :users,controllers: {
    sessions: 'users/sessions'
  }
  get 'items/index'
  root "items#index"
  resources :items do
   resources :addresses, only:[:index,:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
