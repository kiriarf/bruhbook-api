Rails.application.routes.draw do
  resources :posts only: [:index, :show, :create, :update, :destroy]
  resources :registrations, only: [:create]
  resources :sessions, only: [:create]
  resources :users, only: [:index, :show]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  root to: "static#home"
end
