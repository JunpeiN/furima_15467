Rails.application.routes.draw do
  devise_for :users,controllers: {
    sessions: 'users/sessions'
  }
  root "items#index"
  resources :items do
   resources :comments, only: [:create,:destroy]
   resources :addresses, only:[:index,:new,:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
