Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  devise_scope :user do
    get "/custom_sign_out" => "devise/sessions#destroy", as: :custom_destroy_user_session
  end
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:create, :new, :destroy]
      resources :likes, only: [:create]
    end
  end
  
  namespace :api do
    resources :users, only: [:index] do
      resources :posts, only: [:index, :show, :create, :destroy] do
        resources :comments, only: [:index, :create]
      end
    end
  end
end
