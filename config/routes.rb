Rails.application.routes.draw do
  root "application#index", page: "index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  resource :sessions, only: [:destroy]
  resources :users, only: [:show, :new, :update, :create] do
    resources :teams, only: [:new, :create, :update, :destroy]
  end
  resources :pokemons, only: [:index, :show]
  resources :teams, only: [:index, :show]
end
