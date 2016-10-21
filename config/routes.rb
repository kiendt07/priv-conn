Rails.application.routes.draw do
  root 'users#new'
  resources :users
  resources :connections, only: [:index, :new, :create, :destroy]

  # Log in
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  # Log out
  delete 'logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
