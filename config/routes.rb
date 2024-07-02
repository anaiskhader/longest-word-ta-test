Rails.application.routes.draw do
  devise_for :users
  root to: "parties#new"

  resources :games, only: [:create] do
    resources :parties, only: [:new, :create, :show]
  end
end
