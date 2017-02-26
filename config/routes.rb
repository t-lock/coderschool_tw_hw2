Rails.application.routes.draw do
  resources :messages
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users
  root 'home#index'

  get 'users' => 'user#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
