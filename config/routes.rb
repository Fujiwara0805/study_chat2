Rails.application.routes.draw do
  devise_for :users
  root to: 'questions#index'
  resources :questions, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :answers, only: [:create] 
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
end
