Rails.application.routes.draw do
  namespace :admin do
      resources :study_groups
      resources :study_group_memberships
      resources :users, only: %i(index show new create edit update destroy)

      root to: "users#index"
  end
  resources :study_group_comments, only: [:update, :destroy]
  resources :study_group_posts, only: [:update, :show, :destroy] do
    resources :study_group_comments, only: [:create]
  end
  resources :users
  resources :study_groups do
    resources :study_group_posts, only: [:create, :index]
    member do
      get :going
      get :not_going
    end
  end

  post 'auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
