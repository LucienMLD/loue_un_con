Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :users, only: [:new, :create, :show]
  resources :performances do
    resources :bookings, only: [:new, :create, :index, :show, :delete]
  end
end
