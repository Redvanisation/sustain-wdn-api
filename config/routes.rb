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
    end
  end

  post 'auth/login', to: 'authentication#authenticate'


  post 'auth/users/register', controller: 'api/v1/users', action: 'create'
  post 'auth/facilitators/register', controller: 'api/v1/facilitators', action: 'create'
  post 'auth/organizations/register', controller: 'api/v1/organizations', action: 'create'

  # delete 'auth/logout', controller: 'api/v1/sessions', action: 'destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
