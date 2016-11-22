Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:new, :create, :show]
  resources :performances do
    resources :bookings, only: [:new, :create, :show, :index, :delete]
  end
  # get '/bookings/:id' => 'bookings#show', as: 'booking'
end
