Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, :defaults => { :format => 'json' } do
    namespace :v1 do
      post "login" => "authentications#login"
      post "logout" => "authentications#logout"

      namespace :users do
        get "notifications"
      end

      resources :users, only: [] do
        get :portfolios
      end

      resources :notifications, only: [:index, :create] do
        put :send_notification
      end
    end
  end
end
