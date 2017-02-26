Rails.application.routes.draw do
  root 'home#index'
  resources :messages
  resources :users

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'users/add/:id' => 'users#add_friend', as: :add_friend
  get 'users/remove/:id' => 'users#remove_friend', as: :remove_friend

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
