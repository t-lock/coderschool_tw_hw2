Rails.application.routes.draw do
  get 'login' => "sessions#new"
  post 'sessions' => 'sessions#create', as: :submit_login
  delete 'logout' => 'sessions#destroy'
  resources :users
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
