Rails.application.routes.draw do
  root to: 'lists#index'
  devise_for :users
  resources :lists

  resources :items do
    collection do
      post :toggle_checked
    end
  end

  scope module: :user do
    resources :users do
      resources :lists
    end
  end
 end
