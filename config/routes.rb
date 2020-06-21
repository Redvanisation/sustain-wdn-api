Rails.application.routes.draw do
  # root 'api/v1/users/index'

  resources :sessions, only: [:create, :destroy]
  
  namespace :api do
    namespace :v1 do
      # resources :sessions, only: [:create, :destroy]
      resources :users, except: [:edit, :new, :delete]
      resources :facilitators, except: [:edit, :new, :delete]
      resources :organizations, except: [:edit, :new, :delete]
      resources :opportunities, except: [:edit, :new, :delete]
      resources :pathways, except: [:edit, :new, :delete]
      resources :user_pathways, only: [:index, :create, :update]
      resources :facilitator_users, except: [:create, :update, :edit, :new, :delete, :destroy]
      resources :worksheets_upload, only: [:update]
    end
  end

  # put 'api/v1/upload/user/:id', controller: 'api/v1/users', action: 'documents'
  post 'auth/login', to: 'authentication#authenticate'

  get 'api/v1/youth-count/:user_id', controller: 'api/v1/facilitator_users', action: 'users_count'

  post 'auth/users/register', controller: 'api/v1/users', action: 'create'
  post 'auth/facilitators/register', controller: 'api/v1/facilitators', action: 'create'
  post 'auth/organizations/register', controller: 'api/v1/organizations', action: 'create'

  # delete 'auth/logout', controller: 'api/v1/sessions', action: 'destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
