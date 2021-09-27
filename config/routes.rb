Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  mount ActionCable.server => '/cable'

  resources :users, only: [:index, :create]
  resources :auth, only: [:create]

  resources :users do
    resources :rooms, only: [:index]
  end

  resources :users do
    resources :friendships do
      resources :messages, only: [:create, :index]
    end
  end

  resources :users do
    resources :friendships, only: [:index]
  end

end
