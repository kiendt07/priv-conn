Rails.application.routes.draw do
  get 'friendships/create'

  root 'connections#index'
  resources :users do
    resources :connections
  end
  resources :connections do
    collection do
      get 'in'
      get 'out'
    end
  end

  resources :friendships, only: [:create]

  # Log in
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  # Log out
  delete 'logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
