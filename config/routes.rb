Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  root 'users#index'
  # Sign up
  resources :users

  # Log in
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  # Log out
  delete 'logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
