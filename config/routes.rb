Rails.application.routes.draw do
  namespace :admin do
      resources :study_groups
      resources :study_group_memberships
      resources :users, only: %i(index show new create edit update destroy)

      root to: "users#index"
    end
  resources :users
  resources :study_groups
  post 'auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
