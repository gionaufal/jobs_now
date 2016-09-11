Rails.application.routes.draw do
  root to: 'home#index'
  resources :jobs do
    resources :users, only: [:create]
  end
  resources :companies, only: [:show, :new, :create, :edit, :update]
  resources :categories, only: [:show, :new, :create]
end
