Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'confirmations' }

  namespace :admin do
      resources :study_groups
      resources :study_group_memberships
      resources :users, only: %i(index show new create edit update destroy)

      root to: "users#index"
  end
  resources :study_group_comments, only: [:update, :destroy]
  resources :study_group_posts, only: [:update, :destroy] do
    resources :study_group_comments, only: [:create, :index]
  end
  resources :users do
    collection do
      get :recover_password
    end
  end
  resources :study_groups do
    resources :study_group_posts, only: [:create, :index]
    member do
      get :going
      get :not_going
      get :create_bookmark
      get :delete_bookmark
    end
    collection do
      get :search
    end
  end

  post 'auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
