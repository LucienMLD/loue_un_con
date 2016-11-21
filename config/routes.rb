Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show, :new, :create]
  resources :performances do
    resources :bookings, only: [:index, :show, :new, :create, :delete]
  end
end
