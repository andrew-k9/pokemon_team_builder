Rails.application.routes.draw do
  root "application#index", page: "index"
  resources :users, only: [:show, :new, :update, :create]
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  resource :sessions, only: [:destroy]
end
