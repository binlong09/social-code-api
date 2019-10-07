Rails.application.routes.draw do
  namespace :admin do
      resources :study_groups
      resources :study_group_memberships
      resources :users

      root to: "study_groups#index"
    end
  resources :users
  post 'auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
