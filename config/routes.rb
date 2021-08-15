Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :create]
  resources :auth, only: [:create]
  resources :messages, only: [:create]

  resources :users do
    resources :friendships,only: [:index]
  end

end
