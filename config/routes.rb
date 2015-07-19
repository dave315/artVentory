Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :categories, only: [:index, :show, :new, :create]
end
