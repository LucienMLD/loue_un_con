Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :users, only: [:new, :create, :show]
  resources :performances do
    resources :bookings, only: [:new, :create, :index, :destroy]
  end
  delete '/bookings/:id'    => 'bookings#destroy', as: 'destroy_booking'
  get '/bookings/:id'       => 'bookings#show', as: 'booking'
  patch '/bookings/:id'     => 'bookings#update', as: 'accept_booking'
  get '/list-performances'  => 'pages#list_perf'
  get '/list-bookings'      => 'pages#list_bookings'
  get '/dashboard'          => 'pages#dashboard'
  get '/search'             => 'pages#search'
end
