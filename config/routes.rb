Rails.application.routes.draw do
  devise_for :users
  resources :lists

  resources :items do
    collection do
      post :toggle_checked
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
