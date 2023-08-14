Rails.application.routes.draw do
  resources :posts, only: [:update, :show]
  resources :authors, only: [:show, :create]
end
