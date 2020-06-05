Rails.application.routes.draw do
  # root 'api/v1/users/index'

  namespace :api do
    namespace :v1 do
      resources :users
      resources :facilitators
      resources :organizations
    end
  end

  post 'auth/users/register', controller: 'api/v1/users', action: 'create'
  post 'auth/facilitators/register', controller: 'api/v1/facilitators', action: 'create'
  post 'auth/organizations/register', controller: 'api/v1/organizations', action: 'create'
  post 'auth/login', to: 'sessions#create'
  delete 'auth/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
