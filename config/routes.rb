Rails.application.routes.draw do
  root to: 'lists#index'
  mount ActionCable.server => '/ws'
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
      resources :favorited_lists
    end
  end
end
