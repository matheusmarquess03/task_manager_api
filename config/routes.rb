require 'api_version_constraint'

Rails.application.routes.draw do
  devise_for :users, only: [:sessions], controllers: { sessions: 'api/v1/sessions' }


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace 'api' do
    namespace 'v1' do
      mount_devise_token_auth_for 'User', at: 'auth'

      resources :users, only: [:show, :create, :update, :destroy]
      resources :tasks
      resources :sessions, only: [:create, :destroy]
    end 
  end
end