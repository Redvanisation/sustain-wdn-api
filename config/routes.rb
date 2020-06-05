Rails.application.routes.draw do
  # root 'api/v1/users/index'

  namespace :api do
    namespace :v1 do
      resources :users
      resources :facilitators
    end
  end

  post 'auth/register', controller: 'api/v1/users', action: 'create'
  post 'auth/login', to: 'sessions#create'
  delete 'auth/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
