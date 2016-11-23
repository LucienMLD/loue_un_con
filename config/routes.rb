Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :users, only: [:new, :create, :show]
  resources :performances do
    resources :bookings, only: [:new, :create, :index]
  end
  delete '/bookings/:id' => 'bookings#destroy', as: 'destroy_booking'
  get '/bookings/:id' => 'bookings#show', as: 'booking'
  get '/list-performances' => 'pages#list_perf'
end
