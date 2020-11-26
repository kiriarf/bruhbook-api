Rails.application.routes.draw do
  resources :posts, only: [:index, :show, :create, :update, :destroy]
  # resources :registrations, only: [:create]
  resources :likes, only: [:create]
  resources :bullshits, only: [:create]
  resources :comments, only: [:create]
  resources :users, only: [:index, :show]
  post :login, to: "sessions#create"
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  post :signup, to: "registrations#create"
  root to: "static#home"
end
