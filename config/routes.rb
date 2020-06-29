Rails.application.routes.draw do
  root "application#index", page: "index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  resource :sessions, only: [:destroy]
  resources :users, only: [:show, :new, :update, :create]
  resources :pokemons, only: [:index, :show]
  resources :teams
end
